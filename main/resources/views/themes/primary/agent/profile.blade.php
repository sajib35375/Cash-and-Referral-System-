@extends($activeTheme. 'layouts.agent')
@section('agent')
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card custom--card shadow bdr">
                    <div class="card-header head">
                        <h5 class="card-title">@lang('Profile')</h5>
                    </div>
                    <div class="card-body">
                        <form class="register" action="" method="post" enctype="multipart/form-data">
                            @csrf
                            <div class="row">
                                <div class="form-group col-sm-6">
                                    <label class="form-label">@lang('First Name')</label>
                                    <input type="text" class="form-control form--control" name="firstname" value="{{@$agent->firstname}}" required>
                                </div>
                                <div class="form-group col-sm-6">
                                    <label class="form-label">@lang('Last Name')</label>
                                    <input type="text" class="form-control form--control" name="lastname" value="{{@$agent->lastname}}" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-sm-6">
                                    <label class="form-label">@lang('E-mail Address')</label>
                                    <input class="form-control form--control" value="{{@$agent->email}}" readonly>
                                </div>
                                <div class="form-group col-sm-6">
                                    <label class="form-label">@lang('Mobile Number')</label>
                                    <input class="form-control form--control" value="{{@$agent->mobile}}" readonly>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-sm-6">
                                    <label class="form-label">@lang('State')</label>
                                    <input type="text" class="form-control form--control" name="state" value="{{@$agent->address->state}}">
                                </div>
                                <div class="form-group col-sm-6">
                                    <label class="form-label">@lang('Zip Code')</label>
                                    <input type="text" class="form-control form--control" name="zip" value="{{@$agent->address->zip}}">
                                </div>
                            </div>


                            <div class="row">
                                <div class="form-group col-sm-6">
                                    <label class="form-label">@lang('City')</label>
                                    <input type="text" class="form-control form--control" name="city" value="{{@$agent->address->city}}">
                                </div>

                                <div class="form-group col-sm-6">
                                    <label class="form-label">@lang('Country')</label>
                                    <input class="form-control form--control" value="{{@$agent->country_name}}" disabled>
                                </div>

                                <div class="form-group col-sm-6">
                                    <label class="form-label">@lang('Image')</label>
                                    <input name="image" class="form-control form--control" type="file" accept=".png, .jpg, .jpeg">
                                </div>

                                <div class="form-group col-sm-6">
                                    <img id="img" src={{ getImage(getFilePath('userProfile').'/'.@$agent->image, getFileSize('userProfile')) }} alt="image">
                                </div>

                            </div>

                            <div class="form-group">
                                <button type="submit" class="btn btn-info w-100">@lang('Submit')</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('page-style')
    <style>
        .bdr {
            border: 1px solid #e9e9e9;
        }
        .head {
            background-color: #000;
        }
        .head h5 {
            color : #fff;
        }
        img#img {
            width: 100px;
            height: 100px;
        }
    </style>
@endpush

@push('page-script')
    <script>
        (function ($) {
            "use strict";
            $('[name="image"]').on('change', function (e) {
                e.preventDefault();
                let url = URL.createObjectURL(e.target.files[0])
                $('img#img').attr('src',url).width('100px').height('100px')
            });

        })(jQuery)
    </script>
@endpush
