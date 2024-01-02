@extends('admin.layouts.master')
@section('master')
<div class="wrap">
    <div class="row">
        <div class="col-xxl">
            <div class="card mb-4">
                <form class="card-body" action="{{ route('admin.charge.view.store') }}" method="POST">
                    @csrf
                    <div class="row g-4">
                        <div class="col-md-12">
                            <div class="card border h-100">
                                <h5 class="card-header  border-bottom">@lang('CashOut Configuration')</h5>
                                <div class="card-body p-3 pt-0">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="row mb-3 mt-3">
                                                <label class="col-md-4 col-form-label required">@lang('Fixed Charge')</label>
                                                <div class="col-md-8">
                                                    <div class="input-group">
                                                        <input type="number" value="{{ getAmount(@$charges->cash_out_charge_fixed) }}" step="any" min="0" class="form-control" name="cash_out_charge_fixed" required>
                                                        <span class="input-group-text cursor-pointer">{{ __($setting->site_cur) }}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3 mt-3">
                                                <label class="col-md-4 col-form-label required">@lang('Percent Charge')</label>
                                                <div class="col-md-8">
                                                    <div class="input-group">
                                                        <input type="number" value="{{ getAmount(@$charges->cash_out_charge_percentage) }}" step="any" min="0" class="form-control" name="cash_out_charge_percentage" required>
                                                        <span class="input-group-text cursor-pointer">%</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3 mt-3">
                                                <label class="col-md-4 col-form-label required">@lang('Cash Out Commission')</label>
                                                <div class="col-md-8">
                                                    <div class="input-group">
                                                        <input type="number" value="{{ getAmount(@$charges->cash_out_commission) }}" step="any" min="0" class="form-control" name="cash_out_commission" required>
                                                        <span class="input-group-text cursor-pointer">%</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="row mb-3 mt-3">
                                                <label class="col-md-4 col-form-label required">@lang('Minimum Amount')</label>
                                                <div class="col-md-8">
                                                    <div class="input-group">
                                                        <input type="number" value="{{ getAmount(@$charges->cash_out_min) }}" step="any" min="0" class="form-control" name="cash_out_min" required>
                                                        <span class="input-group-text cursor-pointer">{{ __($setting->site_cur) }}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3 mt-3">
                                                <label class="col-md-4 col-form-label required">@lang('Maximum Amount')</label>
                                                <div class="col-md-8">
                                                    <div class="input-group">
                                                        <input type="number" value="{{ getAmount(@$charges->cash_out_max) }}" step="any" min="0" class="form-control" name="cash_out_max" required>
                                                        <span class="input-group-text cursor-pointer">{{ __($setting->site_cur) }}</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="card border h-100">
                                <h5 class="card-header  border-bottom">@lang('CashIn Configuration')</h5>
                                <div class="card-body p-3 pt-0">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="row mb-3 mt-3">
                                                <label class="col-md-4 col-form-label required">@lang('Fixed Charge')</label>
                                                <div class="col-md-8">
                                                    <div class="input-group">
                                                        <input type="number" step="any" min="0" value="{{ getAmount(@$charges->cash_in_charge_fixed) }}" class="form-control" name="cash_in_charge_fixed" required>
                                                        <span class="input-group-text cursor-pointer">{{ __($setting->site_cur) }}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3 mt-3">
                                                <label class="col-md-4 col-form-label required">@lang('Percent Charge')</label>
                                                <div class="col-md-8">
                                                    <div class="input-group">
                                                        <input type="number" step="any" min="0" value="{{ getAmount(@$charges->cash_in_charge_percentage) }}" class="form-control" name="cash_in_charge_percentage" required>
                                                        <span class="input-group-text cursor-pointer">%</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3 mt-3">
                                                <label class="col-md-4 col-form-label required">@lang('Cash In Commission')</label>
                                                <div class="col-md-8">
                                                    <div class="input-group">
                                                        <input type="number" step="any" min="0" value="{{ getAmount(@$charges->cash_in_commission) }}" class="form-control" name="cash_in_commission" required>
                                                        <span class="input-group-text cursor-pointer">%</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="row mb-3 mt-3">
                                                <label class="col-md-4 col-form-label required">@lang('Minimum Amount')</label>
                                                <div class="col-md-8">
                                                    <div class="input-group">
                                                        <input type="number" step="any" min="0" value="{{ getAmount(@$charges->cash_in_min) }}" class="form-control" name="cash_in_min" required>
                                                        <span class="input-group-text cursor-pointer">{{ __($setting->site_cur) }}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3 mt-3">
                                                <label class="col-md-4 col-form-label required">@lang('Maximum Amount')</label>
                                                <div class="col-md-8">
                                                    <div class="input-group">
                                                        <input type="number" step="any" min="0" value="{{ getAmount(@$charges->cash_in_max) }}" class="form-control" name="cash_in_max" required>
                                                        <span class="input-group-text cursor-pointer">{{ __($setting->site_cur) }}</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="card border h-100">
                                <h5 class="card-header  border-bottom">@lang('Send Money Configuration')</h5>
                                <div class="card-body p-3 pt-0">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="row mb-3 mt-3">
                                                <label class="col-md-4 col-form-label required">@lang('Fixed Charge')</label>
                                                <div class="col-md-8">
                                                    <div class="input-group">
                                                        <input type="number" step="any" min="0" value="{{ getAmount(@$charges->send_money_charge_fixed) }}" class="form-control" name="send_money_charge_fixed" required>
                                                        <span class="input-group-text cursor-pointer">{{ __($setting->site_cur) }}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3 mt-3">
                                                <label class="col-md-4 col-form-label required">@lang('Percent Charge')</label>
                                                <div class="col-md-8">
                                                    <div class="input-group">
                                                        <input type="number" step="any" min="0" value="{{ getAmount(@$charges->send_money_charge_percentage) }}" class="form-control" name="send_money_charge_percentage" required>
                                                        <span class="input-group-text cursor-pointer">%</span>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-md-6">
                                            <div class="row mb-3 mt-3">
                                                <label class="col-md-4 col-form-label required">@lang('Minimum Amount')</label>
                                                <div class="col-md-8">
                                                    <div class="input-group">
                                                        <input type="number" step="any" min="0" value="{{ getAmount(@$charges->send_money_min) }}" class="form-control" name="send_money_min" required>
                                                        <span class="input-group-text cursor-pointer">{{ __($setting->site_cur) }}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3 mt-3">
                                                <label class="col-md-4 col-form-label required">@lang('Maximum Amount')</label>
                                                <div class="col-md-8">
                                                    <div class="input-group">
                                                        <input type="number" step="any" min="0" value="{{ getAmount(@$charges->send_money_max) }}" class="form-control" name="send_money_max" required>
                                                        <span class="input-group-text cursor-pointer">{{ __($setting->site_cur) }}</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="my-3">
                        <div class="col-12 text-center">
                            <button type="submit" class="btn btn-primary me-2">@lang('Submit')</button>
                            <button type="reset" class="btn btn-label-secondary">@lang('Cancel')</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
