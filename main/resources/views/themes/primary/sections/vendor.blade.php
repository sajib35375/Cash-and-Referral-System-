@php
    $vendorElements = getSiteData('vendor.element', false);
@endphp
<div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
    <div class="container py-5 mb-5">
        <div class="bg-white">
            <div class="owl-carousel vendor-carousel">
                @foreach($vendorElements as $vendor)
                    <img src="{{ getImage('assets/images/site/vendor/'.@$vendor->data_info->image, '150x50') }}" alt="vendor">
                @endforeach
            </div>
        </div>
    </div>
</div>
