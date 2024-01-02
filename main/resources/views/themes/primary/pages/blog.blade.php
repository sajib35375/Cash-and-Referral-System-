@extends($activeTheme. 'layouts.basic')
@section('basic')
    <div class="container-fluid position-relative p-0">
        @include($activeTheme. 'partials.header')
        <div class="container py-5">
            <div class="row g-5">
                <!-- Blog list Start -->
                <div class="col-lg-8">
                    <div class="row g-5">
                        @foreach($blogElements as $blog)
                            <div class="col-md-6 wow slideInUp" data-wow-delay="0.1s">
                                <div class="blog-item bg-light rounded overflow-hidden">
                                    <div class="blog-img position-relative overflow-hidden">
                                        <img class="img-fluid" src="{{ getImage('assets/images/site/blog/thumb_' . @$blog->data_info->image,'400x280') }}" alt="">
                                        <a class="position-absolute top-0 start-0 bg-primary text-white rounded-end mt-5 py-2 px-4" href="">{{ __(@$blog->data_info->profession) }}</a>
                                    </div>
                                    <div class="p-4">
                                        <div class="d-flex mb-3">
                                            <small class="me-3"><i class="far fa-user text-primary me-2"></i>{{ __(@$blog->data_info->name) }}</small>
                                            <small><i class="far fa-calendar-alt text-primary me-2"></i>{{ date('d, M,Y', strtotime( @$blog->data_info->created_at)) }}</small>
                                        </div>
                                        <h4 class="mb-3">{{ __(@$blog->data_info->title) }}</h4>
                                        <p>{{ __(@$blog->data_info->short_text) }}</p>
                                        <a class="text-uppercase" href="{{ route('blog.details',$blog->id) }}"> @lang('Read More') <i class="bi bi-arrow-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="mb-5 wow slideInUp" data-wow-delay="0.1s">
                        <div class="section-title section-title-sm position-relative pb-3 mb-4">
                            <h3 class="mb-0">@lang('Recent Post')</h3>
                        </div>
                        @foreach($blogElements as $blog)
                        <div class="d-flex rounded overflow-hidden mb-3">
                            <img class="img-fluid" src="{{ getImage('assets/images/site/blog/thumb_' . @$blog->data_info->image,'400x280') }}" style="width: 100px; height: 100px; object-fit: cover;" alt="">
                            <a href="{{ route('blog.details',$blog->id) }}" class="h5 fw-semi-bold d-flex align-items-center bg-light px-3 mb-0">{{ __(@$blog->data_info->title) }}
                            </a>
                        </div>
                        @endforeach
                    </div>
                    <div class="mb-5 wow slideInUp" data-wow-delay="0.1s">
                        <img src="{{ URL::to('') }}/assets/images/site/blog/blog.jpg" alt="" class="img-fluid rounded">
                    </div>
                </div>
            </div>
        </div>
        @include($activeTheme.'sections.vendor')
    </div>
@endsection
