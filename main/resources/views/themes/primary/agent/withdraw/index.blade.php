@extends($activeTheme. 'layouts.agent')
@section('agent')
<div class="py-5">
    <div class="container">
        <div class="row justify-content-center mt-2">
            <div class="col-lg-12 ">
                <form action="">
                    <div class="mb-3 d-flex justify-content-end w-50">
                        <div class="input-group">
                            <input type="text" name="search" class="form-control" value="{{ request()->search }}" placeholder="@lang('Search by transactions')">
                            <button class="input-group-text bg-primary text-white">
                                <i class="las la-search"></i>
                            </button>
                        </div>
                    </div>
                </form>
                <div class="card custom--card">
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table custom--table">
                                <thead>
                                    <tr>
                                        <th>@lang('Gateway | Transaction')</th>
                                        <th class="text-center">@lang('Initiated')</th>
                                        <th class="text-center">@lang('Amount')</th>
                                        <th class="text-center">@lang('Conversion')</th>
                                        <th class="text-center">@lang('Status')</th>
                                        <th>@lang('Action')</th>
                                    </tr>
                                </thead>
                                <tbody>

                                @forelse($withdraws as $withdraw)
                                    <tr>
                                        <td>
                                            <span class="fw-bold"><span class="text-primary"> {{ __(@$withdraw->method->name) }}</span></span>
                                            <br>
                                            <small>{{ $withdraw->trx }}</small>
                                        </td>
                                        <td class="text-center">
                                            {{ showDateTime($withdraw->created_at) }} <br>  {{ diffForHumans($withdraw->created_at) }}
                                        </td>
                                        <td class="text-center">
                                            {{ __($setting->cur_sym) }}{{ showAmount($withdraw->amount ) }} - <span class="text-danger" title="@lang('charge')">{{ showAmount($withdraw->charge)}} </span>
                                             <br>
                                             <strong title="@lang('Amount after charge')">
                                             {{ showAmount($withdraw->amount-$withdraw->charge) }} {{ __($setting->site_cur) }}
                                             </strong>

                                         </td>
                                         <td class="text-center">
                                            1 {{ __($setting->site_cur) }} =  {{ showAmount($withdraw->rate) }} {{ __($withdraw->currency) }}
                                             <br>
                                             <strong>{{ showAmount($withdraw->final_amount) }} {{ __($withdraw->currency) }}</strong>
                                         </td>
                                         <td class="text-center">
                                            @if($withdraw->status == ManageStatus::PAYMENT_PENDING)
                                                <span class="badge bg-warning">@lang('Pending')</span>
                                            @elseif($withdraw->status == ManageStatus::PAYMENT_SUCCESS)
                                                <span><span class="badge bg-success">@lang('Done')
                                            @elseif($withdraw->status == ManageStatus::PAYMENT_REJECT)
                                                <span><span class="badge bg-danger">@lang('Canceled')
                                            @else
                                                <span class="badge bg-dark">@lang('Initiated')</span>
                                            @endif
                                        </td>
                                        <td>
                                            <button class="btn btn-sm btn-success detailBtn"
                                            data-user_data="{{ json_encode($withdraw->withdraw_information) }}"
                                            @if ($withdraw->status == ManageStatus::PAYMENT_REJECT)
                                            data-admin_feedback="{{ $withdraw->admin_feedback }}"
                                            @endif
                                            >
                                                <i class="la la-desktop"></i>
                                            </button>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td class="text-muted text-center" colspan="100%">{{ __($emptyMessage) }}</td>
                                    </tr>
                                @endforelse
                                </tbody>
                            </table>
                        </div>
                    </div>
                    @if($withdraws->hasPages())
                    <div class="card-footer">
                        {{$withdraws->links()}}
                    </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>



 {{-- APPROVE MODAL --}}
<div id="detailModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">@lang('Details')</h5>
                <span type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <i class="las la-times"></i>
                </span>
            </div>
            <div class="modal-body">
                <ul class="list-group userData">

                </ul>
                <div class="feedback"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-dark btn-sm" data-bs-dismiss="modal">@lang('Close')</button>
            </div>
        </div>
    </div>
</div>
@endsection

@push('page-script')
    <script>
        (function ($) {
            "use strict";

            $('.detailBtn').on('click', function () {
                var modal = $('#detailModal');
                var userData = $(this).data('user_data');
                var html = ``;
                userData.forEach(element => {
                    let fileDownloadUrl = '{{ route("user.file.download",["filePath" => "verify"]) }}';

                    if(element.type != 'file') {
                        if (!element.value) { return; }
                        html += `<li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span>${element.name}</span>
                                    <span">${element.value}</span>
                                </li>`;
                    } else {
                        html += `<li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span>${element.name}</span>
                                    <span">
                                        <a href="${fileDownloadUrl}&fileName=${element.value}">
                                            <i class="las la-arrow-circle-down"></i> @lang('Attachment')
                                        </a>
                                    </span>
                                </li>`;
                    }
                });

                modal.find('.userData').html(html);

                if($(this).data('admin_feedback') != undefined){
                    var adminFeedback = `
                        <div class="my-3">
                            <strong>@lang('Admin Feedback')</strong>
                            <p>${$(this).data('admin_feedback')}</p>
                        </div>
                    `;
                }else{
                    var adminFeedback = '';
                }

                modal.find('.feedback').html(adminFeedback);

                modal.modal('show');
            });
        })(jQuery);

    </script>
@endpush
