<?php

namespace App\Http\Controllers\Gateway\Razorpay;

use App\Constants\ManageStatus;
use App\Models\Deposit;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Gateway\PaymentController;
use Illuminate\Http\Request;
use Razorpay\Api\Api;


class ProcessController extends Controller
{
    /*
     * RazorPay Gateway
     */

    public static function process($deposit)
    {
        $razorAcc = json_decode($deposit->gatewayCurrency()->gateway_parameter);

        //  API request and response for creating an order
        $api_key    = $razorAcc->key_id;
        $api_secret = $razorAcc->key_secret;

        try {
            $api   = new Api($api_key, $api_secret);
            $order = $api->order->create(
                array(
                    'receipt'         => $deposit->trx,
                    'amount'          => round($deposit->final_amo * 100),
                    'currency'        => $deposit->method_currency,
                    'payment_capture' => '0'
                )
            );
        } catch (\Exception $e) {
            $send['error']   = true;
            $send['message'] = $e->getMessage();
            return json_encode($send);
        }

        $alias = $deposit->gateway->alias;

        if (auth()->check()) {
            $fullName = auth()->user()->firstname . ' ' . auth()->user()->lastname;
            $email    = auth()->user()->email;
            $mobile   = auth()->user()->mobile;
            $username = auth()->user()->username;
            $view     = 'user.payment.' . $alias;
        }

        if (auth()->guard('agent')->user()) {
            $fullName = auth()->guard('agent')->user()->firstname . ' ' . auth()->guard('agent')->user()->lastname;
            $email    = auth()->guard('agent')->user()->email;
            $mobile   = auth()->guard('agent')->user()->mobile;
            $username = auth()->guard('agent')->user()->username;
            $view     = 'agent.payment.' . $alias;
        }

        $deposit->btc_wallet = $order->id;
        $deposit->save();

        $val['key']             = $razorAcc->key_id;
        $val['amount']          = round($deposit->final_amo * 100);
        $val['currency']        = $deposit->method_currency;
        $val['order_id']        = $order['id'];
        $val['buttontext']      = "Pay with Razorpay";
        $val['name']            = $username;
        $val['description']     = "Payment By Razorpay";
        $val['image']           = getImage(getFilePath('logoFavicon').'/logo.png');
        $val['prefill.name']    = $fullName;
        $val['prefill.email']   = $email;
        $val['prefill.contact'] = $mobile;
        $val['theme.color']     = "#2ecc71";

        $send['val']            = $val;
        $send['method']         = 'POST';

        $send['url']         = route('ipn.'.$alias);
        $send['custom']      = $deposit->trx;
        $send['checkout_js'] = "https://checkout.razorpay.com/v1/checkout.js";
        $send['view']        = 'user.payment.'.$alias;

        return json_encode($send);
    }

    public function ipn(Request $request)
    {

        $deposit  = Deposit::where('btc_wallet', $request->razorpay_order_id)->orderBy('id', 'DESC')->first();
        $razorAcc = json_decode($deposit->gatewayCurrency()->gateway_parameter);

        if (!$deposit) {
            $toast[] = ['error', 'Invalid request'];
        }

        $sig = hash_hmac('sha256', $request->razorpay_order_id . "|" . $request->razorpay_payment_id, $razorAcc->key_secret);
        $deposit->detail = $request->all();
        $deposit->save();

        if ($sig == $request->razorpay_signature && $deposit->status == ManageStatus::PAYMENT_INITIATE) {
            PaymentController::userDataUpdate($deposit);
            $toast[] = ['success', 'Transaction was successful'];
            return to_route(gatewayRedirectUrl(true))->withToasts($toast);
        } else {
            $toast[] = ['error', "Invalid Request"];
            return to_route(gatewayRedirectUrl())->withToasts($toast);
        }

    }
}
