Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986035;
	b=xSetT9h/m/u70LTNBPUkutnedkUDadEAa5k+UO4Nh7ethCawJNgndYkwNXVxEZFgSu3U
	 qa/xtPpNFuGq9D+HxvovvtEZL99dPONPAS7bbx4tR8hqB9x2WaUCcNxKyfUO1anPYKGTL
	 koM26IngY3rUb4fkk8Fmo1zd4ke181z9Qs4yF3oJbGN2ZtPPLl5HwBUAH1wh/o1SxAz7a
	 j3kAIV+AqWPb648HcYFO6SzqNSZuBxhlOKEC3dLxagZeIgxEme0MiVCEm/QIAwG5BzzBG
	 Xr5sGvh4ebxillVxYg5H4kl+YsbYRroihHBVNjIZ8hS+aTwhHR9SqhueEgSZ4KIVe7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986035;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=Ph5YKB0KYtns94WSrNcsTtEuW7NVt+Gyk8TBrJACobE=;
	b=DHUhyju0BOwn0wb+5ORrmdmFmhH46ODFKsaauMiMuzW5QTu05uPs6HGU3eElp7gIbnoo
	 ZDDSjDwORrMPSQYFaK96QwtdxBvcgbTPl/G4HqimjWbDjUn96qnLhgUVrm/oQGFRP0TR1
	 hPCsCzZOPqCSkGDuu5cQ2CkAehTZHszGAEaACbhkAUhZ/Icw7E9fTJr/m1zGlaU6jiYBs
	 ZZZMBYdfxaLMx3kZ1Fjq7JKJnSU0KkqwQ3ylihO5oKXU8OiUmS/wgM3aAHX5ev16RsII4
	 ST7ZnOIyONpiHSYr9vckiSFa+V7GzLQVVPWVxXo7+k75vmdeZJI+/QaxWhikamaqwVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hgSVEB7r;
	arc=none smtp.remote-ip=91.218.175.174
Received: from mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9586D606A329
	for <linux-wireless@vger.kernel.org>; Fri,  6 Nov 2026 17:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9586D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hgSVEB7r
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=U0fucB1f/JzZvNxYUiDjoItugCcDyDJ/lZcOOVQKZRg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793986032; v=1; x=1794590832;
 b=hgSVEB7rRJYAJOe33KgdU+0UI+mlhTCvb1qRN1ATMN0NyFo3L/5A/LrqQtEtGPocdf3Xd5cT
 MM5HarHWTM2zE17+P05VIEukMwc6XEjv8uI1z/g+dwkitqKoPNmPMOU65+rWOuqizk+rIIQnONe
 zhBem5bLPqA9YuRv59bFVp6Q=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 12b6b9dc5f411ab5;
	Fri, 06 Nov 2026 17:27:12 +0000
X-Mizu-Trace-ID: 12b6b9dc5f411ab5
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 17:27:11 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <2df200abb7d9b07abf8883fcc06f4a7b0d3591c5@linux.dev>
TLS-Required: No
Subject: Re: [PATCH rtw-next v2 5/7] wifi: rtw88: 88xxa: correct
 carrier-frequency offset
To: "Ho Jie Feng" <hjf3108@gmail.com>, "Ping-Ke Shih" <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, "Ho Jie Feng" <hjf3108@gmail.com>,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261031070950.425176-6-hjf3108@gmail.com>
References: <20261031070950.425176-1-hjf3108@gmail.com>
 <20261031070950.425176-6-hjf3108@gmail.com>

Hi Jie Feng,

A few small comments below.

October 31, 2026 at 8:09 AM, "Ho Jie Feng" <hjf3108@gmail.com> wrote:

> diff --git a/drivers/net/wireless/realtek/rtw88/phy.c b/drivers/net/wir=
eless/realtek/rtw88/phy.c
> index d0c1fb65be9563c5fc29a7d18a1c9e8589730b10..69998c0d7c1f851bb30d270=
2233d62e14b305bf0 100644
> --- a/drivers/net/wireless/realtek/rtw88/phy.c
> +++ b/drivers/net/wireless/realtek/rtw88/phy.c
> @@ -687,13 +687,14 @@ static void rtw_phy_parsing_cfo_iter(void *data, =
u8 *mac,
>       struct rtw_rx_pkt_stat *pkt_stat =3D iter_data->pkt_stat;
>       struct rtw_dm_info *dm_info =3D &rtwdev->dm_info;
>       struct rtw_cfo_track *cfo =3D &dm_info->cfo_track;
> +     u8 path_num =3D min_t(u8, rtwdev->hal.rf_path_num, 2);

This and the same line in rtw_phy_cfo_xcap_track() are in core code that
every chip uses. As far as I can see the limit is only there for 8814a,
which has four paths but reports a CFO tail only for A and B. A short
comment saying so would help, otherwise the 2 looks arbitrary.

The commit message could mention this core change too, together with
the CFO tracking for 8814a that this patch adds.

[ ... ]

> diff --git a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c b/drivers/ne=
t/wireless/realtek/rtw88/rtw88xxa.c
> index 87253fffe78cd6f5b58a325eef42b58b968e2d46..851d198f76f3b10d5ba77c7=
e07e4be9d7fd54e4b 100644
> --- a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
> +++ b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
> @@ -279,6 +279,7 @@ int rtw88xxa_read_efuse(struct rtw_dev *rtwdev, u8 =
*log_map)
>       efuse->crystal_cap =3D map->xtal_k;
>       if (efuse->crystal_cap =3D=3D 0xff)
>               efuse->crystal_cap =3D 0x20;
> +     efuse->crystal_cap &=3D 0x3F;

[ ... ]

> +     rtw88xxa_set_crystal_cap(rtwdev, rtwdev->efuse.crystal_cap & 0x3F=
);

With the mask in rtw88xxa_read_efuse() the & 0x3F here isn't needed
anymore.

The 6 bit limit now shows up as 0x3F or 0x3f in five places across
rtw88xxa.c and rtw8814a.c. Maybe a define in rtw88xxa.h, which
rtw8814a.c includes too, similar to XCAP_MASK in rtw8822c.h.

Best regards,
Luka Gejak
