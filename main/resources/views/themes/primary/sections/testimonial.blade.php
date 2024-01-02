@php
    $testimonialContent = getSiteData('testimonial.content',true,null,false);
    $testimonialElements = getSiteData('testimonial.element',false,null,true);
@endphp
<div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
    <div class="container py-5">
        <div class="section-title text-center position-relative pb-3 mb-4 mx-auto" style="max-width: 600px;">
            <h5 class="fw-bold text-primary text-uppercase">{{ __(@$testimonialContent->data_info->sub_heading) }}</h5>
            <h1 class="mb-0">{{ __(@$testimonialContent->data_info->heading) }}</h1>
        </div>
        <div class="owl-carousel testimonial-carousel wow fadeInUp" data-wow-delay="0.6s">
            @foreach($testimonialElements as $testimonial)
            <div class="testimonial-item bg-light my-4">
                <div class="d-flex align-items-center border-bottom pt-5 pb-4 px-5">
                    <img class="img-fluid rounded" src="{{ getImage('assets/images/site/testimonial/'.@$testimonial->data_info->image,'100x100') }}" style="width: 60px; height: 60px;" >
                    <div class="ps-4">
                        <h4 class="text-primary mb-1">{{ __(@$testimonial->data_info->client_name) }}</h4>
                        <small class="text-uppercase">{{ __(@$testimonial->data_info->profession) }}</small>
                    </div>
                </div>
                <div class="pt-4 pb-5 px-5">
                    {{ __(@$testimonial->data_info->details) }}
                </div>
            </div>
            @endforeach
        </div>
    </div>
</div>
