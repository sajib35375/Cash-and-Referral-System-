@extends('admin.layouts.master')

@section('master')
    <div class="row">
        <div class="col-xxl">
            <div class="card-body">
                <div class="row g-4">
                    @foreach ($plugins as $plugin)
                        <div class="col-lg-6 col-md-6">
                            <div class="card h-100">
                                <div class="card-body">
                                    <div class="row gy-3">
                                        <div class="col-sm-8">
                                            <span class="d-flex flex-wrap align-items-center">
                                                <div class="flex-shrink-0">
                                                    <img src="{{ getImage(getFilePath('plugin').'/'.@$plugin->image) }}" alt="signup" class="me-3" height="40">
                                                </div>
                                                <div>
                                                    <b>{{ __($plugin->name) }}</b>
                                                    <div class="card-header-elements">@php echo $plugin->statusBadge @endphp</div>
                                                </div>
                                            </span>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="d-flex justify-content-sm-end justify-content-center">
                                                <button type="button" class="btn rounded-pill btn-label-primary editBtn" data-route="{{ route('admin.plugin.setting.update', $plugin->id) }}" data-name="{{ __($plugin->name) }}" data-shortcode="{{ json_encode($plugin->shortcode) }}" data-status="{{ $plugin->status }}">
                                                    <i class="las la-pen me-1"></i> @lang('Edit')
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>

    {{-- Edit Modal --}}
    <div class="modal fade" id="editModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalCenterTitle">@lang('Update plugin'): <span class="plugin-name"></span></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <hr>
                <form method="POST">
                    @csrf
                    <div class="modal-body">
                        <div class="plugin-html"></div>

                        <div class="row mb-3">
                            <label class="col-sm-3 col-form-label required">@lang('Status')</label>
                            <div class="col-sm-9">
                                <label class="switch me-0">
                                    <input type="checkbox" class="switch-input" name="status">
                                    @include('admin.partials.switcher')
                                </label>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">@lang('Close')</button>
                        <button type="submit" class="btn btn-primary">@lang('Update')</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@push('page-script')
    <script>
        (function ($) {
            "use strict";

            $('.editBtn').on('click', function () {
                let modal     = $('#editModal');
                let shortcode = $(this).data('shortcode');
                let id        = $(this).data('id');
                let html      = '';

                modal.find('.plugin-name').text($(this).data('name'));
                modal.find('form').attr('action', $(this).data('route'));
                modal.find('[name=status]').prop('checked', $(this).data('status') ? true : false);

                $.each(shortcode, function (key, item) {
                    html += `<div class="row mb-3">
                                <label class="col-sm-3 col-form-label required">${item.title}</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="${key}" placeholder="----" value="${item.value}" required>
                                </div>
                            </div>`;
                });

                modal.find('.plugin-html').html(html);
                modal.modal('show');
            });
        })(jQuery);
    </script>
@endpush

