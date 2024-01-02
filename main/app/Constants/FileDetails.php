<?php

namespace App\Constants;

class FileDetails {
    function fileDetails() {
        $data['logoFavicon'] = [
            'path' => 'assets/universal/images/logoFavicon',
        ];

        $data['favicon'] = [
            'size' => '128x128',
        ];

        $data['seo'] = [
            'path' => 'assets/universal/images/seo',
            'size' => '1180x600',
        ];

        $data['adminProfile'] = [
            'path' => 'assets/admin/images/profile',
            'size' => '200x200',
        ];

        $data['userProfile'] = [
            'path' => 'assets/user/images/profile',
            'size' => '200x200',
        ];

        $data['plugin'] = [
            'path' => 'assets/admin/images/plugin'
        ];

        $data['setting'] = [
            'path' => 'assets/admin/images/setting'
        ];

        $data['verify'] = [
            'path'      =>'assets/verify'
        ];

        return $data;
    }
}
