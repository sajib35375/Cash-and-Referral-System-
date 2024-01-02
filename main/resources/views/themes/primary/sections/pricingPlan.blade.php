@php
 $pricingContent = getSiteData('pricing.content',true, null, false);
 $pricingElements = getSiteData('pricing.element',false,null,true);
@endphp
<div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
    <div class="container py-5">
        <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width: 600px;">
            <h5 class="fw-bold text-primary text-uppercase">{{ __(@$pricingContent->data_info->subheading) }}</h5>
            <h1 class="mb-0">{{ __(@$pricingContent->data_info->heading) }}</h1>
        </div>
        <div class="row g-0">

            @foreach($pricingElements as $price)

            <div class="col-lg-4 wow slideInUp" data-wow-delay="0.6s">
                <div class="bg-light rounded">
                    <div class="border-bottom py-4 px-5 mb-4">
                        <h4 class="text-primary mb-1">{{ __(@$price->data_info->title) }}</h4>
                        <small class="text-uppercase">{{ __(@$price->data_info->sub_title) }}</small>
                    </div>
                    <div class="p-5 pt-0">
                        <h1 class="display-5 mb-3">
                            <small class="align-top" style="font-size: 22px; line-height: 45px;">$</small>{{ @$price->data_info->price }}<small
                                class="align-bottom" style="font-size: 16px; line-height: 40px;">/ {{ __(@$price->data_info->duration) }}</small>
                        </h1>
                        <div class="d-flex justify-content-between mb-3"><span>{{ __(@$price->data_info->service_one) }}</span> @php echo @$price->data_info->service_one_icon; @endphp </i></div>
                        <div class="d-flex justify-content-between mb-3"><span>{{ __(@$price->data_info->service_two) }}</span> @php echo @$price->data_info->service_two_icon; @endphp </div>
                        <div class="d-flex justify-content-between mb-3"><span>{{ __(@$price->data_info->service_three) }}</span> @php echo @$price->data_info->service_three_icon; @endphp </div>
                        <div class="d-flex justify-content-between mb-2"><span>{{ __(@$price->data_info->service_four) }}</span> @php echo @$price->data_info->service_four_icon; @endphp </div>
                        <a href="" class="btn btn-primary py-2 px-4 mt-4">{{ __(@$price->data_info->button) }}</a>
                    </div>
                </div>
            </div>

            @endforeach

        </div>
    </div>
</div>

