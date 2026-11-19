Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795060669;
	b=OxmlHOz8OUr2D3Uo1+XcUGG0krxuVkUzqCUsWE6pHpOdTv8uY1FYxhjlUImKqwypIglT
	 Y9Hvv7dsHpGxHITIbJPP9SHp8r+pBNYhehpm/p2ATyoSSMMrdhNEMkGiUeG8OHmXNqCxL
	 NNVOVtmN/TYmXZ7CVTrybrWhmi447puvlRv2zB8h2YqgarLCzc1xtOdLPwI7eH3JVYpz2
	 jbgc7W9YkSCTxZlwo3AsKm4Wjh+gAJ5Ae89dujRLip1C7AVPwq/8EiSxVULEalZ/4VruC
	 hKIO/2tLNzG/QZztpWcjEVl1P5O8YnsVGWP+DvtT8tBKVQtUOR73soLi+G9lTZCS75w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795060669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=BKHwVioFID9w4JdnGIv32WJD2aWmVB4i12sx6XZEIoA=;
	b=C0RYcTMSIXD4bTF8EELuIrtlhJSUhqW96YTrCr3kGIZ8IAjhzBnic3e+JQQx3WWX6ax3
	 2w4c8dut+69hmDVW6WgDnqDHEICXtJzpDCDa9cxt5vlImI1Mi/HbL9/XAd4V19uOwsYO8
	 SAkg2+/hA2ynspbsHxD+CfRSFsW64bTyFVelYdSEt/Dqi3y8pPSgu1EeKXNgLdH1s+4Vv
	 PqqH1YOw/p/bWzmDjULk5fmrvkbtAhtz4KXI4Qicg8/Ml8gv0CbduLEe4OP+XXb8UTs67
	 vo9ig1MvTB1/eeJn5e84Uqj5Fm0Gzb88RJgZIVolk3faFtgUOpyIl8gLsNqnZIT/iYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R3zhn2g9;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7069A606A325
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 03:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7069A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R3zhn2g9
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-381f65e4e4bso2826886eec.0
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 19:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795060668; x=1795665468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BKHwVioFID9w4JdnGIv32WJD2aWmVB4i12sx6XZEIoA=;
        b=R3zhn2g9kEZ3cLgMPXK2p3qkGjTnV4a7UfvpAuoeO8XiO46lJEb3Zm8DTK4D+Olg+b
         /f+qJHm6p//P6VtBlhP20tSYp92WVHjcx8U7EeiHnHcffCORV9NYXVArjFIQPq8WXLJk
         whhIShHk2t9SwB3zMpLipJau4u98lrcGmhY4qJ9ax3sAcyR3OIusvbTZx+aTyhSGIRb4
         nMbuzidesHZegnC5R5t3d34oOTSzMmnWQ8TPtN2Z4L1tYOrBCeCsF+JKLaaFCtnfVFOx
         CEsN8pKdYi1Fgh8BZha0Jae4QNvu2uWAHdztN2i1bQZ5/xS7vvzYFAAZsdrRlh8kCaJM
         Bv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795060668; x=1795665468;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BKHwVioFID9w4JdnGIv32WJD2aWmVB4i12sx6XZEIoA=;
        b=zGOtCbeev1PxxBw3KCtc2hB7IvMZn0i6N9VEDlJo6qpy+qCYpestCxhDCFXHWIaMlg
         xWNuWuc2iVBzEuGkynw4bA22IeaaRW0t0hXCveggTVfpIsic7hoAM19TU/qZbEOuDqyx
         9UrNVTAEuiO2q87NkkTIyoBQdtloO77xSXvx8s/FjSxlHidSsK2EZFT/FHfAYBP/KQ/F
         KJLTZ4t/4893IeizewAkxUPYKpO99I9Tv9WhlfJYT/EKXyt9665rPUT5sLO+kTVfJPaU
         qz8Wh/4YJa4/6Jf1gNpFq1ksU3uTrzNHjq90ScaC0cPsujFMvhwSibbVXUHQjP0qQrFv
         ORow==
X-Gm-Message-State: APuU4Z8aTPoBQNpeGnHuldYitWV3GnLLVuVbTSdBPVIY3PaT+v+uHqX1
	Cs+yppvaowkYEmHFRBzsxzaHc8kNOEayZNfNOaRo62OApeZJrGoUCuE1/KZbDA==
X-Gm-Gg: AYBFou3jRh9FlMQT8m/8sU8FPMg4ZFADDE5aBLNQ+72hVkKNMlFadD03CtuexBD1ILQ
	h6brVqej5YTfHyApPWLUeP/zVldsyB8HNS4hpgmajxoDeINNJwL5F3dL4jSiqbYdhHh9ZGdzQ+v
	/DIbxTy6GEMXj+nc66F4wviegSEAc80ZAXj/xCCC7zSmEii+rFiesAC+qkizfaVe4TGWvKOjTB+
	tF3OPH1/H+0XroE2aQxQ1/OaN3xE10OPpa8msCZhBKmmAmMPivsF8IWBYB3bUjeUChyitCgkZ0M
	TEeK/NOLN62G8HDW3T6xo86oI2/Yy0t6EYUq4n1RB6O7qWKkQPKthnnj5teMTK/GRwQy24PCYVE
	v0ffC3hDzAJP4IMiv1Z/9wISGttQpc9zNRH5xUXonqKbdYhPi17J0oLLtRPdLmcG64Q7peiAYaV
	ffjA+NiCGafAYtTCLmblIu9nlnXdpBO2Dag6pX5TFaU3ivVc3GmahCALdPlIerVEwWJ8YQLmC5A
	TOnyX3HYGuZ7NIQJC872cIUgtNC/F/6aHtYD0OTYu4kCLOHbrSx3KFB2GoqNemalXUUoJGYMXYH
	+XhC7yOUNSy4z1+gkpOh1Ojbd5yW1LQO
X-Received: by 2002:a05:701a:844e:10b0:1a0:b8f5:872d with SMTP id a92af1059eb24-1b543c12d96mr4204014c88.4.1795060668465;
        Wed, 18 Nov 2026 19:57:48 -0800 (PST)
Received: from embed-PC ([2406:b400:d4:8653:e135:1dec:3a2f:1f46])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4e19sm15384037c88.13.2026.11.18.19.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 19:57:47 -0800 (PST)
Date: Thu, 19 Nov 2026 09:27:41 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: rtw89: 8852au: Add support for Mercusys MA72XH
Message-ID: <av5ztQNkWSsLE4NA@embed-PC>
References: <20260710030055.57438-1-abhishektamboli9@gmail.com>
 <9bfdb983981d4bb98a4692ac6f1711f6@realtek.com>
 <8fb9ced500144618b7f43e54c12a25ff@realtek.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fb9ced500144618b7f43e54c12a25ff@realtek.com>

On Wed, Jul 15, 2026 at 09:16:09AM +0000, Ping-Ke Shih wrote:
> Ping-Ke Shih <pkshih@realtek.com> wrote:
> > Abhishek Tamboli <abhishektamboli9@gmail.com> wrote:
> > > Add the ID 2c4e:0124 to the rtw_8852au_id_table to
> > > support the Mercusys MA72XH usb adapter.
> > >
> > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=221738
> > 
> > Not sure why I have no permission to access this. Maybe it gets broken.
> > I'll wait a while to see if people will fix it.
> 
> I seems that my Windows desktop can't access this link, but
> Ubuntu is fine. I have not idea why. 
> 
> Anyway, the reporter is still not confirmed if this patch works.
> Can you post the update here when getting acked?

Hi Ping-Ke,

Update on the Mercusys MA72XH (2c4e:0124) report: the bugzilla
reporter confirmed that the adapter works with the 8852AU code path once
the ID is present (tested with morrownr's out-of-tree driver, which has
the ID). The earlier failure on his system came from the rtw88 DKMS
rtw_8821au module claiming the same ID, which is unrelated to this
patch.

I asked him to test the mainline rtw89_8852au with the patch, but he
hasn't responded for several weeks.

Regards,
Abhishek
