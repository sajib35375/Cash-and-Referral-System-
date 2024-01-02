@extends('admin.layouts.master')
@section('master')
    <div class="wrap ">
        <div class="row d-flex justify-content-center">
            <div class="col-md-8 col-lg-8 col-sm-12">
                <div class="card my-5 mb-5">
                    <div class="card-body status">
                        <div class="commission">
                            @if($setting->cashin_commission == \App\Constants\ManageStatus::YES)
                                <span class="badge bg-success">Enable</span>
                            @else
                                <span class="badge bg-danger">Disable</span>
                            @endif
                        </div>
                        <div class="action">
                            @if($setting->cashin_commission == \App\Constants\ManageStatus::YES)
                                <a class="btn btn-danger" href="{{ route('admin.ref.status.enable') }}">Disable</a>
                            @else
                                <a class="btn btn-success" href="{{ route('admin.ref.status.disable') }}">Enable</a>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row d-flex justify-content-center">
            <div class="col-md-8 col-lg-8 col-sm-12 ">
                <div class="card">
                    <div class="card-body">
                        <form action="{{ route('admin.ref.store') }}" method="POST">
                            @csrf
                            <input type="hidden" class="label form-control" name="type"  value="cashin">
                            <div class="addItem">
                                <div class="row g-0">
                                    <div class="col-md-3 d-flex">
                                        <span class="label control">@lang('Level')</span>
                                        <input type="number" name="level[]" class="label control" value="1" readonly>
                                    </div>
                                    <div class="col-md-2">
                                        <input type="number" name="percent[]" placeholder="@lang('Percent')" class="control" required>
                                    </div>
                                    <div class="col-md-3 ">
                                        <button type="button" class="btn btn-primary button addEvent"><i class="fas fa-plus"></i></button>
                                    </div>
                                </div>
                            </div>
                            <div class="my-3">
                                <button type="submit" class="btn btn-primary">@lang('Submit')</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="wrap">
        <div class="row d-flex justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h2>@lang('All Level Commission')</h2>
                    </div>
                    <div class="card-body">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>@lang('Commission Type')</th>
                                <th>@lang('Level')</th>
                                <th>@lang('Percent')</th>
                                <th>@lang('Created At')</th>
                            </tr>
                            </thead>
                            <tbody class="table-border-bottom-0">

                            @forelse ($referral as $data)
                                <tr>
                                    <td>
                                        <span class="fw-bold">{{ __(@$data->type) }}</span>
                                    </td>
                                    <td>
                                        <span class="fw-bold">{{ @$data->level }}</span>
                                    </td>
                                    <td>{{ @$data->percent }} %</td>
                                    <td>
                                        {{ showDateTime(@$data->ceated_at) }}<br>
                                        {{ diffForHumans(@$data->created_at) }}
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="100%" class="text-center">{{ __($emptyMessage) }}</td>
                                </tr>
                            @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('page-script')
    <script>
        (function ($) {
            "use strict";

            let i = 2;
            $('.addEvent').on('click', function () {
                let htmlToAdd = `<div class="row mt-4 g-0">
                                    <div class="col-md-3 d-flex">
                                        <span class="label control">@lang('Level')</span>
                                        <input type="number" name="level[]" class="label control" value="${i}" readonly>
                                    </div>
                                    <div class="col-md-2">
                                        <input type="number" name="percent[]" placeholder="@lang('Percent')" class="control" required>
                                    </div>
                                    <div class="col-md-3 my-2">
                                        <button type="button" class="btn btn-danger button removeEvent"><i class="fas fa-minus"></i></button>
                                    </div>
                                </div>`;
                $('.addItem').append(htmlToAdd);
                i++;
            });

            $(document).on('click','.removeEvent',function (){
                $(this).closest('.row').remove();
            });

        })(jQuery);
    </script>
@endpush

@push('page-style')
    <style>
        .label {
            background-color: #e9ecef;
        }
        .control {
            width: 100%;
            height: 100%;
            padding: 10px 20px;
            border: 1px solid #bdc3c7;
        }
        .status {
            display: flex;
            justify-content: space-between;
        }
        .wrap {
            margin-top: 30px;
        }
        .button {
            margin-left: 20px;
            margin-top: 3px;
        }
    </style>
@endpush
