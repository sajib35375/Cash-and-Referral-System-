@php
    $blogContent = getSiteData('blog.content',true);
    $blogElements = getSiteData('blog.element',false);
@endphp
<div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
    <div class="container py-5">
        <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width: 600px;">
            <h5 class="fw-bold text-primary text-uppercase">{{ __(@$blogContent->data_info->subheading) }}</h5>
            <h1 class="mb-0">{{ __(@$blogContent->data_info->heading) }}</h1>
        </div>
        <div class="row g-5">
            @foreach($blogElements as $blog)
                <div class="col-lg-4 wow slideInUp" data-wow-delay="0.3s">
                    <div class="blog-item bg-light rounded overflow-hidden">
                        <div class="blog-img position-relative overflow-hidden">
                            <img class="img-fluid" src="{{ getImage('assets/images/site/blog/thumb_'. @$blog->data_info->image, '400x280') }}" alt="">
                            <a class="position-absolute top-0 start-0 bg-primary text-white rounded-end mt-5 py-2 px-4" href="">{{ __(@$blog->data_info->profession) }}</a>
                        </div>
                        <div class="p-4">
                            <div class="d-flex mb-3">
                                <small class="me-3"><i class="far fa-user text-primary me-2"></i>{{ __(@$blog->data_info->name) }}</small>
                                <small><i class="far fa-calendar-alt text-primary me-2"></i>{{ date('d, M,Y', strtotime( @$blog->data_info->created_at)) }}</small>
                            </div>
                            <h4 class="mb-3">{{ __(strlimit(@$blog->data_info->title)), 5 }}</h4>
                            <p>{{ __(@$blog->data_info->short_text) }}</p>
                            <a class="text-uppercase" href="{{ route('blog.details',$blog->id) }}">@lang('Read More') <i class="bi bi-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</div>
