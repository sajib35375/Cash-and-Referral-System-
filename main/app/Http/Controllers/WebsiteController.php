<?php

namespace App\Http\Controllers;

use App\Constants\ManageStatus;
use App\Models\Contact;
use App\Models\Language;
use App\Models\SiteData;
use Illuminate\Support\Facades\Cookie;

class WebsiteController extends Controller
{
    function home() {
        $pageTitle = 'Home';
        return view($this->activeTheme . 'home', compact('pageTitle'));
    }

    function changeLanguage($lang = null) {
        $language = Language::where('code', $lang)->first();

        if (!$language) $lang = 'en';
        session()->put('lang', $lang);
        return back();
    }

    function cookieAccept() {
        Cookie::queue('gdpr_cookie', bs('site_name'), 43200);
    }

    function cookiePolicy() {
        $pageTitle = 'Cookie Policy';
        $cookie    = SiteData::where('data_key', 'cookie.data')->first();

        return view($this->activeTheme . 'cookie',compact('pageTitle', 'cookie'));
    }

    function maintenance() {
        if(bs('site_maintenance') == ManageStatus::INACTIVE) {
            return to_route('home');
        }

        $maintenance = SiteData::where('data_key', 'maintenance.data')->first();
        $pageTitle   = $maintenance->data_info->heading;

        return view($this->activeTheme . 'maintenance', compact('pageTitle', 'maintenance'));
    }

    public function policyPages($slug,$id) {
        $policy    = SiteData::where('id', $id)->where('data_key', 'policy_pages.element')->firstOrFail();
        $pageTitle = $policy->data_info->title;

        return view($this->activeTheme . 'policy', compact('policy', 'pageTitle'));
    }

    function contact() {
        $pageTitle = 'Contact';
        $user      = auth()->user();

        return view($this->activeTheme . 'contact', compact('pageTitle', 'user'));
    }

    function contactStore() {
        $this->validate(request(), [
            'name'    => 'required|string|max:40',
            'email'   => 'required|string|max:40',
            'subject' => 'required|string|max:255',
            'message' => 'required',
        ]);

        $user         = auth()->user();
        $email        = $user ? $user->email : request('email');
        $contactCheck = Contact::where('email', $email)->where('status', ManageStatus::NO)->first();

        if ($contactCheck) {
            $toast[] = ['warning', 'There is an existing contact on record, kindly await the admin\'s response'];
            return back()->withToasts($toast);
        }

        $contact          = new Contact();
        $contact->name    = $user ? $user->fullname : request('name');
        $contact->email   = $email;
        $contact->subject = request('subject');
        $contact->message = request('message');
        $contact->save();

        $toast[] = ['success', 'We register this contact in our record, kindly await the admin\'s response'];
        return back()->withToasts($toast);
    }

    function placeholderImage($size = null) {
        $imgWidth  = explode('x',$size)[0];
        $imgHeight = explode('x',$size)[1];
        $text      = $imgWidth . '×' . $imgHeight;
        $fontFile  = realpath('assets/font/RobotoMono-Regular.ttf');
        $fontSize  = round(($imgWidth - 50) / 8);

        if ($fontSize <= 9) {
            $fontSize = 9;
        }

        if($imgHeight < 100 && $fontSize > 30){
            $fontSize = 30;
        }

        $image      = imagecreatetruecolor($imgWidth, $imgHeight);
        $colorFill  = imagecolorallocate($image, 100, 100, 100);
        $bgFill     = imagecolorallocate($image, 175, 175, 175);
        imagefill($image, 0, 0, $bgFill);
        $textBox    = imagettfbbox($fontSize, 0, $fontFile, $text);
        $textWidth  = abs($textBox[4] - $textBox[0]);
        $textHeight = abs($textBox[5] - $textBox[1]);
        $textX      = ($imgWidth - $textWidth) / 2;
        $textY      = ($imgHeight + $textHeight) / 2;
        header('Content-Type: image/jpeg');
        imagettftext($image, $fontSize, 0, $textX, $textY, $colorFill, $fontFile, $text);
        imagejpeg($image);
        imagedestroy($image);
    }
    // blog details
    function blogDetails($id) {
        $site        = SiteData::findOrFail($id);
        $pageTitle   = 'Blog Details';
        $allBlogData = getSiteData('blog.element',false,null,true);
        return view($this->activeTheme. 'pages.blogDetails', compact('site','pageTitle','allBlogData'));
    }

    function about() {
        $pageTitle = 'About Us';
        return view($this->activeTheme. 'pages.about', compact('pageTitle'));
    }

    function service() {
        $pageTitle = 'Services';
        return view($this->activeTheme. 'pages.service', compact('pageTitle'));
    }

    function blog() {
        $pageTitle    = 'Blog Us';
        $blogElements = getSiteData('blog.element',false,null,true);
        return view($this->activeTheme. 'pages.blog', compact('pageTitle','blogElements'));
    }

    function contactUs() {
        $pageTitle      = 'Contact Us';
        $user           = auth()->user();
        $contactContent = getSiteData('contact_page.content',true,null,false);
        return view($this->activeTheme. 'pages.contact', compact('pageTitle','user','contactContent'));
    }
}
