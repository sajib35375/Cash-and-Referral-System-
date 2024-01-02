@php
   $serviceContent = getSiteData('service.content',true, null, false);
   $serviceElements = getSiteData('service.element',false, null, false);
@endphp
<div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
    <div class="container py-5">
        <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width: 600px;">
            <h5 class="fw-bold text-primary text-uppercase">{{ __(@$serviceContent->data_info->subheading) }}</h5>
            <h1 class="mb-0">{{ __(@$serviceContent->data_info->heading) }}</h1>
        </div>
        <div class="row g-5">

            @foreach($serviceElements as $service)

            <div class="col-lg-4 col-md-6 wow zoomIn" data-wow-delay="0.3s">
                <div class="service-item bg-light rounded d-flex flex-column align-items-center justify-content-center text-center">
                    <div class="service-icon">
                        @php echo @$service->data_info->heading_icon; @endphp
                    </div>
                    <h4 class="mb-3">{{ __(@$service->data_info->title) }}</h4>
                    <p class="m-0">{{ __(@$service->data_info->details) }}</p>
                    <a class="btn btn-lg btn-primary rounded" href="">
                        @php echo @$service->data_info->clickable_icon; @endphp
                    </a>
                </div>
            </div>

            @endforeach


            <div class="col-lg-4 col-md-6 wow zoomIn" data-wow-delay="0.9s">
                <div class="position-relative bg-primary rounded h-100 d-flex flex-column align-items-center justify-content-center text-center p-5">
                    <h3 class="text-white mb-3">{{ __(@$serviceContent->data_info->contact_heading) }}</h3>
                    <p class="text-white mb-3">{{ __(@$serviceContent->data_info->contact_details) }}</p>
                    <h2 class="text-white mb-0">{{ @$serviceContent->data_info->contact_number }}</h2>
                </div>
            </div>
        </div>
    </div>
</div>

