Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794557572;
	b=z6vy7G6APs6OLXqKKOaFKi/6EK0s8r35gqakoC2xgId2L1u8J6KliR1BA08D0Mx38Twp
	 g/8pamOyFfs6FzcZqe3W/JujBwA0lcEdBvDlV9kjnV7gB6jvhi+CrSDLXiNhx8PatOZ0d
	 tYbnxP7Y1OCNxhFG3s+Kx/itX1a/mlpn0xLx4m58ATaQ5qf/67IlSdGo/LwiWKpOYRPAS
	 xEum61O45rdPmN7cflRGhIdUE0QVxqrEy/YfYXq6Z3LIFtK/Ge+m3sAYWZ++cGv9sW4jo
	 duCznILHJ58hxWS97ON0CF1aYxbIyFA1/Oe5fYyc58Ewv7DQrCiLMO4l8CzgNPzpwDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=opZlLJLOJr9mWZNC7pqH3rSXoldYSnCPWePhRUrrcbA=;
	b=I2tt+VdhAKWhY7o5+3PzpBM/FDBkELOKwpS84CvMxABu8BOKdbs6Ppc0LNPnkj73Xtmo
	 +21AknjbPQ+tEbHio2YfBYSiWN7R09IXT2a963ycbGjkplV59AGeTYkmVVbHj1ElSh7yJ
	 t+Vo0B+0iXJOu0Wre3SMcNTwdfXFbvsEoJ2MRXLrBKhiCU3o5WiRS9/CuvlWTxVG5zH61
	 n3Evr4JDYKBfX9ZQudRiOBDr5odDg1VN4duBlrjCum5xXFSIC0RdrpZqeNHlGE6IKImAq
	 8BEiqE7A32ty0UrApScHBE/+ht1altZVpaXFcoyTp6+1223dQ9aOwnmJx08TKAAHBbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AXhSTd6n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD6D606A335
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 08:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBD6D606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AXhSTd6n
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-716d052dc23so223457eaf.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 00:12:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794557571; cv=none;
        d=google.com; s=arc-20260327;
        b=Jww9j05fY4hsJrQMPpoUy3bY9jePllVSvpuGG9drZCoGxRlJFDZVy3w8D88SKB/s0K
         SNy+NggO15HFNNFHf8J3E77KTlvghs40JVVUjaTIJTTWpcfc6dLwz9yMyE5wdWCl2eWy
         JUCudjuy4NyJYPZbKavRlAzg4YBUw6byPLw3D7V3xnxSQ+s8PqNCWcU1H68IEKdCALb5
         MZJPBkkpxQ6JZIYFR8jQIRcgfTIlcSLGunxW8DUicUI/k0UxCZjJIpfxF8rUakoI+PHM
         2g7p2jLonXKYxowtahTcTfHUL6KBJFIauPkHZXiriFeMJkXhGkl3cDAY/CGo+eIxxy+l
         lIAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=opZlLJLOJr9mWZNC7pqH3rSXoldYSnCPWePhRUrrcbA=;
        fh=xyBSFavGEPg9VYzHdGusLchDVdKN5+b4NY+FjAarIew=;
        b=AuC4rty8xYeFi9BAxaUnvDtygLg7OCY6jKgZSS92plSa9FdVQs5fdSj/Rpq+AJ3Ujg
         IH8dOMEYrTQBu18XBYESKZj8ZwNoMWOp4lLxxkgruFyHSTIb4+UD5j8SRmTvQHnlpRWN
         3HrU2g/ORDDYu5pLV7gxcR3kFeIoGiVPWTki2JD1w6ZS9hv6MmKk0t27blTQnjiCTCzs
         exdnl33+dSP7+tpfCravl4Q3SvQIZl2OE6Rco+sbVotGoJeMtcex9SuhM2C4zTPgeDzw
         eASCVBm/D1e+HTruseDm5kzsWh+3+wlD2ECEC/txrz7UvMWeGNRl5eJ3qVGecTOH1fhz
         dEpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794557571; x=1795162371; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=opZlLJLOJr9mWZNC7pqH3rSXoldYSnCPWePhRUrrcbA=;
        b=AXhSTd6nftg6zWVJ9fo3q8eYZ4G3S4KS2l4zxMiB7uKk+5Y/IJ/q2IEe49wQoR3JkP
         pz4jG+AUT6R5bR0sQue3zMfIVGVjRregCCDygUWZQTjLYmt33xkMhXvcKZW88FPZbu7a
         1D5ciMNplSGl2ldSO37BNPgb4dnPqWf2WR3SyY9oyFrIXR7xK3Vd/mlxW8SxOQr5ZUGv
         MV82OoXdrBCGAA+aVWsBctSwNbyjjP4r+yyC1lFlA680HzPltfkoi6x35taetsBlayFu
         hpC5bynJtv9d4g6Gml6mxOEzgIAI6tH2Kz2Dy41PU3o7G1HTd6abZ6R372pmQ/1R2Ocl
         raWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557571; x=1795162371;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=opZlLJLOJr9mWZNC7pqH3rSXoldYSnCPWePhRUrrcbA=;
        b=YpAnWw7cONNHtnpR15ZU+64iaqDR+Zqz7nZGMUN5x8MfigBfYH2C+TuKLIe9MfZVvi
         btsvozqA2oB9PZqu8jInPtQrXlaCLoBaHDm95fIIKlsxWwoKaH+aUQcGAVUrhZWjus0k
         xsemgJA34/yYPFwLHL5PzOkgpkJykGkd66dsGCCjwV56leC0Z9QoFRrQMSybzflbcqyF
         ErXHBMN4kJuOkW74PDV7L0vtXxdUIsZclTlLjt4iloADv43kfP/RL05RApRi/+GINiPr
         EAUIfZ5Hv4pwAyP362SLGg5BWrGdYGcoMgYEqoFeArE667PDbn1BBZO18gnwcEQVVASr
         5j3w==
X-Forwarded-Encrypted: i=1; AL+hErFiMPZ+pFAvS0CgA2iZya1VTRPAApuIUVoPKA1b7gTtBzcPkomPzQt7KyLIsewpBrA5Zrmiigfk734YQrLJCQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8MjcKc+ZXUjGXTom6BXeQen2Bg3u6Tdbh0oL6vHPJyBQF1ij/w
	+5FhBsApqWhwCf9z195YvdihDEfw78czgakF7GM8UPVwPQPavFSpODd1df1mm1VMmNUEri7orY3
	1bKvRaeuNrh5hkzuEOEf14olPLKEB8Loi1ngkd1ZEAA==
X-Gm-Gg: AYBFou1Wqshd6YSGL/F4aRiUI0MFIgPD9L0lsG9mnB9D9ucJJoTq8Sy/JclRu9TM20P
	XVwTu7o6770zzpo6g2BEUoKPNgY7jb/o7IgeyuslxopwkRlwrli2uv++qO9CFfpwXX38dgqHU5z
	BgvbCoTGtL4dShOtWGo4Y6g/jkUBFINCLbjo/RfQGhf1Fdil2EspMngpL095zKUnBUdqeEGYTna
	Jumm/aenBBDurgYK2jUjM0o4cTsNC3Of0R4PHnq59m9O3zlSHjjQx1Kl3DIz2Mhkdrj9vcfpHMi
	ZLdV8DjcMQxAu2JgBr98P26Ud79njC7fjYJU0eL7xPDK5EUKA4YvLNOyNtiyo4trorrSnYbkK09
	Pl9NRKEotIKHu02ua8vwVL7ZzvI7aYK5NS5FmHBM4kfyDzK8MwNfpb14NnvWrtI2SDeGA2kWAC0
	fTLUEf0ekMR0LdXg5TwzWfelaUrXHqrVvmH6umFBFKzx0N5baV4Gdu+w==
X-Received: by 2002:a05:6820:1626:b0:70b:af3d:2b2b with SMTP id
 006d021491bc7-71ab520b2ffmr975571eaf.67.1794557570842; Fri, 13 Nov 2026
 00:12:50 -0800 (PST)
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
 <466A842E-68A6-4F5B-B0CB-8EF314AF34DA@linux.dev> <CABOQOSWrZXet+SYmvvG1B+idYmWx60F_prbQ3QGSiKaA7z-AFQ@mail.gmail.com>
 <85E23B83-4D3E-4270-B5A5-B835235093A0@linux.dev>
In-Reply-To: <85E23B83-4D3E-4270-B5A5-B835235093A0@linux.dev>
From: Jie Feng <hjf3108@gmail.com>
Date: Fri, 13 Nov 2026 16:12:13 +0800
X-Gm-Features: AclHuK8IkWODjhJeiKO05zNzg8ptkfLX6Y2XM_QUwiS0tVaj33IW_KAZbd5Fkn4
Message-ID: <CABOQOSX5B4zjORY0JZrt93899Af9V=YBFy7d5537efAQEtQgYA@mail.gmail.com>
Subject: Re: [PATCH rtw-next v3 2/5] wifi: rtw88: 88xxa: receive VHT SU
 beamformed transmissions
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 16:07, Luka Gejak <luka.gejak@linux.dev> wrote:
>
> On November 13, 2026 9:01:47 AM GMT+01:00, Jie Feng <hjf3108@gmail.com>
> wrote:
> >On Fri, 13 Nov 2026 at 15:46, Luka Gejak <luka.gejak@linux.dev> wrote:
> >>
> >> Hi Jie Feng,
> >>
> >> Thanks for the new version. A question and a comment below.
> >>
> >> On November 12, 2026 6:32:41 PM GMT+01:00, Ho Jie Feng
> ><hjf3108@gmail.com>
> >> wrote:
> >>
> >> > diff --git a/drivers/net/wireless/realtek/rtw88/main.c
> >b/drivers/net/wireless/realtek/rtw88/main.c
> >> > index e243738809..fe93c93b1a 100644
> >> > --- a/drivers/net/wireless/realtek/rtw88/main.c
> >> > +++ b/drivers/net/wireless/realtek/rtw88/main.c
> >>
> >> [ ... ]
> >>
> >> > @@ -1621,10 +1622,13 @@ static void rtw_init_vht_cap(struct rtw_dev
> >*rtwdev,
> >> >                      0;
> >> >       if (rtwdev->hal.rf_path_num > 1)
> >> >               vht_cap->cap |= IEEE80211_VHT_CAP_TXSTBC;
> >> > -     vht_cap->cap |= IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE |
> >> > -                     IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE;
> >> > -     vht_cap->cap |= (rtwdev->hal.bfee_sts_cap <<
> >> > -                     IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT);
> >> > +     if (rtw_bf_support && chip->bfer_su_max_num) {
> >> > +             vht_cap->cap |= IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE;
> >> > +             vht_cap->cap |= rtwdev->hal.bfee_sts_cap <<
> >> > +                             IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT;
> >> > +     }
> >> > +     if (rtw_bf_support && chip->bfer_mu_max_num)
> >> > +             vht_cap->cap |= IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE;
> >>
> >> In v2 this was its own patch, 3/7 "correctly expose beamformee
> >> capabilities", after Bitterblue asked on v1 for it to be split out. Was
> >> folding it back in here intended? I couldn't find it in the v3
> >changelog.
> >Sorry, looks like I used the wrong commit on my local tree, will resend as
> >a v4.
> >Please ignore this v3.
> >
>
> Can you address all comments I have send, as they will most likely apply
> to v4 as well?
Yes v4 will address both the csi and cfo comments. I will send it out
after figuring
out the correct fix.

> >> I can see a reason for it. Without this part, an AP that is also a MU
> >> beamformer makes rtw_bf_assoc() take the MU branch and return at
> >> bfer_mu_max_num, so the new config_bfee code would never run for it. If
> >> that is why, maybe mention it in the changelog, and in the commit
> >message
> >> too, since this is core code and the support_bf check now hides the
> >> beamformee caps on every chip when beamforming is turned off.
> >>
> >> [ ... ]
> >>
> >> > diff --git a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
> >b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
> >> > index 55f1d3d324..5d58dff4fc 100644
> >> > --- a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
> >> > +++ b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
> >> > @@ -931,7 +931,7 @@ static const struct rtw_chip_ops rtw8812a_ops = {
> >> >       .phy_calibration        = rtw8812a_phy_calibration,
> >> >       .cck_pd_set             = rtw_phy_cck_pd_set,
> >> >       .pwr_track              = rtw8812a_pwr_track,
> >> > -     .config_bfee            = NULL,
> >> > +     .config_bfee            = rtw88xxa_bf_config_bfee,
> >> >       .set_gid_table          = NULL,
> >> >       .cfg_csi_rate           = NULL,
> >>
> >> As far as I can see, 8812a, 8821a and 8814a are now the first chips that
> >> can become a SU beamformee without a cfg_csi_rate op. Once
> >rtw_bf_assoc()
> >> has set bfee.role, the watchdog goes through
> >>
> >>         rtw_vif_watch_dog_iter()
> >>           rtw_dynamic_csi_rate()
> >>
> >> and there new_csi_rate_idx is only written by that op:
> >>
> >>         u8 new_csi_rate_idx;
> >>         ...
> >>         rtw_chip_cfg_csi_rate(rtwdev, rtwdev->dm_info.min_rssi,
> >>                               bf_info->cur_csi_rpt_rate,
> >>                               fix_rate_enable, &new_csi_rate_idx);
> >>
> >>         if (new_csi_rate_idx != bf_info->cur_csi_rpt_rate)
> >>                 bf_info->cur_csi_rpt_rate = new_csi_rate_idx;
> >>
> >> So if I read it right, it compares and stores an uninitialized value
> >> there. cur_csi_rpt_rate has no other user on these chips, so it seems
> >> harmless for now, but I think KMSAN would report it. Maybe
> >> rtw_dynamic_csi_rate() could return early when the chip has no
> >> cfg_csi_rate op?
This looks correct, will put in v4.

Another alternative would be to do:
u8 new_csi_rate_idx = bf_info->cur_csi_rpt_rate
and the != will never pass.

> >> Best regards,
> >> Luka Gejak
> >
