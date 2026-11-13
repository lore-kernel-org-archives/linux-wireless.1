Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794556945;
	b=QF+jqhdwJL13OPi1AMhaOKsNbdVqL44liWFBjijegPBWMT8lVUgAjJn3lcci0l0JPePj
	 c/WdWqn3itr1orzS/hB4voH6YZCvYWz3kOB59eC6MtyzqrXFOunGTyJOz7YuaE/RvmQj6
	 FGifk0/+XzCQgOeVVX/CvriEa0/MXtmzxbHWSORxWlQkzaKT6tkvUCySVRQ8/tldOIlRu
	 H7Yn2cyR7hXvA0uJGmqi5EsF5VDKgkiblVVE7tD9cvd2Sswdn9hXTHmp1Jljwi2bex3St
	 ZyH8TIM0i2Kdth1pNPPwgRkqgDhw/62Ni7Md52Z/tDno0fu4n/8xX6X4bU8bwnO2q0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1G7wwdsFXzwTZgCSSKtVd92SqpW+oIP50QwttyQt5ZU=;
	b=fSK15Nee+noYFTeWdKDMe3u8Tud0z9aUHcbdVR4IOgot54GEpXBl1NAW47NuCSVk31vK
	 vFSbKs9GvkMEl0Rtd/ZPNXXJ+k7KCaQhtxODVUzgY6gMmUmpGM2KhKksShACJEX+e4poA
	 xv4MS5SS8d8BiSoVeBar2oZGs742mMJHUgVMTzWUWm03dXWTe3WMJ1o7lcKLei6zG7mSK
	 f/tBSIDbrOF+hC152rGhirFPWKY4xRLtSgtIXGxklH6vSwx6YOPpkIOhaCzjlugiYlJnP
	 Z1umWKmuhLnfBSOnePGZp31DGPVodb03OoxXTs8HL8MOpt+6PLAB5jJA/Sh1IB0wXyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RmVsy0qT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1626606A321
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 08:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1626606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RmVsy0qT
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-833e671ee9fso1255838a34.0
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 00:02:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794556943; cv=none;
        d=google.com; s=arc-20260327;
        b=c7qvAM6uKwhbRkFU5h/c0nn8Tb8mugcYMlpxFMQyHbURZFMqdU9eKw37iqyRna8hg0
         Idnpjup7jE7Oo8g22HbtH0BEolwlFQzUSnPOE7a61KQSC+wF37gBNjOzS4FdnhU7l2DA
         co2NXO9o/kexyLs2KIQZammpNLSAg3G8GPIAjI334qZrbN+lun9IIuliP8VBLEDU54/p
         M/CdGmwSxTPU7Sux/IMsc9p3QvHUDoKJaokbCyoAFI5aW8frRoeD1AkA+xEpVsa5edKu
         TuMhAJcm9/GnLXuP6rGKXe6CHekxf7vyK7q+xZKjkNejbHi7+iZVS95Zsi0eJDk/oKQX
         IYYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1G7wwdsFXzwTZgCSSKtVd92SqpW+oIP50QwttyQt5ZU=;
        fh=GRy20b8p4qyDOP29VWo0lMCVQyIObnQ+EPGljp0/Pss=;
        b=SxFRDvyMeejeB4Vb0jQNVnvDcO4f2B6zGw813qwy6IV8Pr5ZTdhcO7+6d72RVcpThb
         ZGTrI4oCWviuzjsHUT41UAjKZQqaXLY1aTu17IHVGutddz34e0Jn56XCZw/qbcAg4keg
         z6ntbdhNml7YM1TV5DEMBdjBKfF/a7BwTIB/2dBuJz923a6i60QW2CeByUfibcb6RBwp
         bsuzznh3JcEd2dSSQkmPZNytnTncqYnqTOo0c4IZG+ojGCh+vP+Bm8pwfTCNaQbgToKS
         csRc6hn7b3mPTKHnBVz3zQqNrXICNu7llHPWbB3uBH2hQ1rHP3tSeqF+o32YlYWEAWbg
         aXvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556943; x=1795161743; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1G7wwdsFXzwTZgCSSKtVd92SqpW+oIP50QwttyQt5ZU=;
        b=RmVsy0qTPdwYUhT/BPsMO15wGkbJRmkO6ydjPv+CctkUsQqIEcS1XM5zBKWz9NBb/H
         wdfaVwyGakRqAbAgNkd+VpkZpqPk9mkz3oRMS+9cKJCMOvzK9myHT0+OTjHARsEqORzF
         hxmqfNrYk17WRfuFnWQJNMY99bltpKRMn0VilyaUEENoCPonQSJ1ATzIpzNAO689zA7w
         O1KAs5wm8+umGRyi+tCYysYAwUcpqSoVq0Uelmi0cUydUCTLHRIUeJirsOdwlsM/Vfph
         RXxp6SNNER9vkGTSYoJkiZt81bk0o4Ci0dLvQ7dXR00jWwP8cwhLsDYkbO4lxZ6ihe77
         dfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556943; x=1795161743;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1G7wwdsFXzwTZgCSSKtVd92SqpW+oIP50QwttyQt5ZU=;
        b=1pKo4m5D0p5ZZjf0u3cPmf+WerT4n5jjF4YBW1+di4f0KwlZ53LVCvjhKaaqsYkaHe
         qcjGk8vE+8puv3hOK9hX5Ygx18bTE7cOYgN5Q5byM3bLIllctKsZixeetrNbnkrSryLG
         o+LB4a+A0t9dbRULXWfZInszg1ZR1c03BWku9Sf2M0EMCWnbJ8ATO4IwiFePlX28vI0Z
         xKnSqqa5RXAAvafyXQsEnOdI1Z20sUp6LA1x2bKEAj2yzlJTzB9zZGNNFZWtIaVR7Ide
         mwcyaCwjr68R6XEOk+Z/U0s7lf0jjXVYrigr0OpDwiMmR3j1WN1e7dNgumOiHIMsU83E
         swiA==
X-Forwarded-Encrypted: i=1; AL+hErH3qD/zGyzVmFM5kAlh2uqXNsdnFqHly4qfPURTJeLobU+LyYHf2oxKj1K6Jx0x8Pv9jE8pKv1EYu+z3TCdMg==@vger.kernel.org
X-Gm-Message-State: APuU4Z98uQ2CImKv11vkZmxj2aLlWImfhr1jdvNMlqzRDkV9OJednKq5
	fuO9OTiIRaPZ+ux/idPVMX7OgI6/K8/F+Py6nRrc2tJIFCBu5efuRv8fcemdQqbrQpYMLmSwDDy
	p9IcScUO5yM01abnWCcnY6qA4Ri+qc58=
X-Gm-Gg: AYBFou3UMImjxIpF9Z/rvoW0IxXCG1sgyy3kacR0vo5r6rFqPg4gGDcxH0L3qf44OGR
	lBKNdP3gl9aQUMlHjgQjGb9a1w5y7MKB+AZPucBcfSzK4BgdGtmdIAfy0ReDsU4Ylu1TDK/uCUg
	5NhEZXon+pheAvU6h7SvcoEeYmBuBmTmFSPX/FZuaIrA8g3ocx7S4WCDgYr3em4f4uBKp2LaksS
	HU4o2uAyfgUsoceGGJ2V38qx8UzcBSYdSndLJ103QGMAnbo2ZfSr1sSvTQRu7fv8o23mmC+wanX
	5zc7rS3j7R8IOTvQWADXPXdt/u5pwBY7Vj/BmT4uYzZy97bFtaWqwftEeNXKB5rtA+p4hvc5IWs
	6j6ZXAwAK6MCOsMl8dri20dD78cz8rra+5zc7FWMPsXRwq/C0gefsuciKvGXK1psdEMaRWCrIbP
	G6woW4AywNSf8d2vDKHwXdueRjPkBCS41g
X-Received: by 2002:a05:6820:1c8c:b0:713:e433:7e6d with SMTP id
 006d021491bc7-71ab4f44671mr1076601eaf.36.1794556943434; Fri, 13 Nov 2026
 00:02:23 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112173246.3201729-1-hjf3108@gmail.com> <20261112173246.3201729-3-hjf3108@gmail.com>
 <466A842E-68A6-4F5B-B0CB-8EF314AF34DA@linux.dev>
In-Reply-To: <466A842E-68A6-4F5B-B0CB-8EF314AF34DA@linux.dev>
From: Jie Feng <hjf3108@gmail.com>
Date: Fri, 13 Nov 2026 16:01:47 +0800
X-Gm-Features: AclHuK-fjDJAVn06x_jUIuJlL-ttRqKElTJSe4FX02KJdGNbRcV68FJ7UkiEH3A
Message-ID: <CABOQOSWrZXet+SYmvvG1B+idYmWx60F_prbQ3QGSiKaA7z-AFQ@mail.gmail.com>
Subject: Re: [PATCH rtw-next v3 2/5] wifi: rtw88: 88xxa: receive VHT SU
 beamformed transmissions
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 15:46, Luka Gejak <luka.gejak@linux.dev> wrote:
>
> Hi Jie Feng,
>
> Thanks for the new version. A question and a comment below.
>
> On November 12, 2026 6:32:41 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
> wrote:
>
> > diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
> > index e243738809..fe93c93b1a 100644
> > --- a/drivers/net/wireless/realtek/rtw88/main.c
> > +++ b/drivers/net/wireless/realtek/rtw88/main.c
>
> [ ... ]
>
> > @@ -1621,10 +1622,13 @@ static void rtw_init_vht_cap(struct rtw_dev *rtwdev,
> >                      0;
> >       if (rtwdev->hal.rf_path_num > 1)
> >               vht_cap->cap |= IEEE80211_VHT_CAP_TXSTBC;
> > -     vht_cap->cap |= IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE |
> > -                     IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE;
> > -     vht_cap->cap |= (rtwdev->hal.bfee_sts_cap <<
> > -                     IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT);
> > +     if (rtw_bf_support && chip->bfer_su_max_num) {
> > +             vht_cap->cap |= IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE;
> > +             vht_cap->cap |= rtwdev->hal.bfee_sts_cap <<
> > +                             IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT;
> > +     }
> > +     if (rtw_bf_support && chip->bfer_mu_max_num)
> > +             vht_cap->cap |= IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE;
>
> In v2 this was its own patch, 3/7 "correctly expose beamformee
> capabilities", after Bitterblue asked on v1 for it to be split out. Was
> folding it back in here intended? I couldn't find it in the v3 changelog.
Sorry, looks like I used the wrong commit on my local tree, will resend as a v4.
Please ignore this v3.

> I can see a reason for it. Without this part, an AP that is also a MU
> beamformer makes rtw_bf_assoc() take the MU branch and return at
> bfer_mu_max_num, so the new config_bfee code would never run for it. If
> that is why, maybe mention it in the changelog, and in the commit message
> too, since this is core code and the support_bf check now hides the
> beamformee caps on every chip when beamforming is turned off.
>
> [ ... ]
>
> > diff --git a/drivers/net/wireless/realtek/rtw88/rtw8812a.c b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
> > index 55f1d3d324..5d58dff4fc 100644
> > --- a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
> > +++ b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
> > @@ -931,7 +931,7 @@ static const struct rtw_chip_ops rtw8812a_ops = {
> >       .phy_calibration        = rtw8812a_phy_calibration,
> >       .cck_pd_set             = rtw_phy_cck_pd_set,
> >       .pwr_track              = rtw8812a_pwr_track,
> > -     .config_bfee            = NULL,
> > +     .config_bfee            = rtw88xxa_bf_config_bfee,
> >       .set_gid_table          = NULL,
> >       .cfg_csi_rate           = NULL,
>
> As far as I can see, 8812a, 8821a and 8814a are now the first chips that
> can become a SU beamformee without a cfg_csi_rate op. Once rtw_bf_assoc()
> has set bfee.role, the watchdog goes through
>
>         rtw_vif_watch_dog_iter()
>           rtw_dynamic_csi_rate()
>
> and there new_csi_rate_idx is only written by that op:
>
>         u8 new_csi_rate_idx;
>         ...
>         rtw_chip_cfg_csi_rate(rtwdev, rtwdev->dm_info.min_rssi,
>                               bf_info->cur_csi_rpt_rate,
>                               fix_rate_enable, &new_csi_rate_idx);
>
>         if (new_csi_rate_idx != bf_info->cur_csi_rpt_rate)
>                 bf_info->cur_csi_rpt_rate = new_csi_rate_idx;
>
> So if I read it right, it compares and stores an uninitialized value
> there. cur_csi_rpt_rate has no other user on these chips, so it seems
> harmless for now, but I think KMSAN would report it. Maybe
> rtw_dynamic_csi_rate() could return early when the chip has no
> cfg_csi_rate op?
>
> Best regards,
> Luka Gejak
