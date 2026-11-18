Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795023602;
	b=uD1Lr95/Q1qoUY3VZypHdATb+MAU+ZveogrvXMmzXuQpVPE0x3qNvnaCaVEyvPQ/eaIg
	 vkMTp+BFLBt16ZkvXDg3l4J8zI0mRcfCdxAVuQqIKxwBYhhG0Ax3rJkLr3SBJv7XgU70G
	 BCnycRUvv1mdVwL2UKgsd/iwzXxCvHXjlan0dgfS9az3px3ugKuq3v4djQweVmVLG8ghx
	 r9wtPtkc+BBzfx+lo44k4Z4FmS8BsNDPAhtK0PPR8xPwTy1Bw74tUmuKm8DPyR6eV45R/
	 vAmhEGR2mSDrts2pzGigSeGo9di2+1Z2gvR/iNHe0Tf0k3h/hcEatWnKBrFQA2KJmuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=B+XUPKMI1yUUNSlRJbGmbg4ef/Yy+CIXY00tImGIAcM=;
	b=iZAt17ygOtzJBq2IFUhikL7aKKm9H1R1LJ94Tz1kF+TGukbOPRTxxBEXjPhtKLttHQaS
	 nLhnPSj2RqxIqRvv+QTPE/n2Km1BTsy6Yb5BWHeWpD5vizgNvWjnrk2ihJi8X2oq/nowL
	 WHy1BO/Ofngx6ZaNjPIakImacZ+tgASKOrWE+ufENEAvNQ8wDIIj7J7/zulgJM4q5NSxa
	 FOoh1Y0pXYKevZbSAL3uSss6o0nxRRYmZYLckCkWG4aq9wqD1HnnvUAqOqZZLLuieFV+5
	 paOC0B7b6zdBvEQ2IhHikKwnBdQln4GTpqq0D+txcWg4NPZ/Z0sQQOoxTBlfVw1XiEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pi0.com;
	spf=pass smtp.mailfrom=domojo.com;
	dkim=pass header.d=pi0.com header.i=@pi0.com header.a=rsa-sha256 header.s=google header.b=OhdqPndI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB6E606A330
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 17:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDB6E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pi0.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=domojo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pi0.com header.i=@pi0.com header.a=rsa-sha256 header.s=google header.b=OhdqPndI
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so9795985e9.3
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 09:40:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795023600; cv=none;
        d=google.com; s=arc-20260327;
        b=XK/9rFxuLnYFoO+oMQ6kEcoY+72p+KAvDJ6GFR+nnPGY4QT9NbTt/X3Ya5ufBA2TqY
         JpdLcOlHC8Cq4wO7ZYImw+iUuE15ZFfQ6j0lWsocJHepHiyhGU2n76uAHcfK3ufOZ4w1
         d67dN1tPeqUHHgBALnx3FYY9+VJqg0eENA3HKNPE57uBVHADIgtMGQx6/8zagIQA8Hb0
         JIbVh2uGWuTxxPl+y7n4rKatx5tR7O0eJrs+/Sr5g90mqYxF/lmHBry6rXu36hln/Qr7
         jGX/e5eo/hxvLlmYIF08B9+ll/uwgULmPpCoPiABwF/h7gTrBMv8UVM9nJPCcQcbzTHO
         neTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B+XUPKMI1yUUNSlRJbGmbg4ef/Yy+CIXY00tImGIAcM=;
        fh=nzqIY8kFewkMeb5YJ5cejGvrkJNO5uQQG04bxLfe25U=;
        b=olVsWFyhxd09bmeLRYjfxBS+RIcTxlwBMUI/sVjqBQ4hSKCq2c00y+1fW2ICNOu4a/
         1JRec3nPFVplVDU9hfHTk/r9jWAKUjY+U5WXT1igpH63kp3IoeKhv75+tyoGWKKvNrdu
         Pti/uivJHZ3nPLWPkBv7hjFZDrkaStkW0TpN8pJW9xpmFYdBdd7B9jQFzhFsnwSwc5cN
         IFvNVa6P4Hxj2yjLbQGHoVJ5l6C9C15cGhWY+HY4j/GE719eiS3ghiKobblWdjNIhE+n
         oh9UlUZLB9Ow7dSLuaBeHTumY9v1oB5KhdowKOa7EV7KEKihJBrKaEukPu3gQ/sNmKqZ
         eGkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pi0.com; s=google; t=1795023600; x=1795628400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B+XUPKMI1yUUNSlRJbGmbg4ef/Yy+CIXY00tImGIAcM=;
        b=OhdqPndIk+TD84m+YE4+0Pzk7ej7LLwS52ppUAMWrHpPsp0AfZwG+NVVWENuXGQXlD
         0UCxZRH894dlb0wV+sTMIB91QVUNhoujRpDW4fj7+XMo9fs1Vtora72J/ibxmKMsS0lR
         Yz3/6WL4dDQK9CylDbmbEH7/yb5NRldvcFfNmCsH19NQToPdSsKZJdE1SS0GhNwbB8e9
         A8AJol/4hnJiinBmpkaMY85tFPzIzEVsJCMEvZUJo0BYxT85J1acfmMgJkhrK31fy0uP
         1kYcJYbHbHBhH7sLjO2C78BGCewRRrq25k3d8arfIBDJYoAKH+jL4dQqeD1PPjQNM1PA
         0yDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795023600; x=1795628400;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B+XUPKMI1yUUNSlRJbGmbg4ef/Yy+CIXY00tImGIAcM=;
        b=sGyvkbp56nB1A88ziNIkspU6tLC9ZddcyLMInleCNTSpiwiVYQaWUDUGOHdqZKoHME
         +Mu3vD7FX1wjJs9KlkGBEgnf+jJ8c4ZHBS2GYX8nvzn6UDDAFr7XjrqyONawAyg+RP6j
         hmQpkPhYo/VK/FRG7n843LkLr4k1dWVmx/r9UAw0v0hhoacVj3eBYVPpTe3V7ebfBPeU
         KeNgvD1j2kwAZGvhuEIH/olwBopIvnNEwVyRK25/lypyE7epyMxx5avX7pMbwGUx2tFv
         rfvlXlCNG6VWZWNFSpSb/jH/Bxp+4KjZyArUu2IxVJqbnePnmUeN0T6ySk1d16ERTKlH
         dprg==
X-Forwarded-Encrypted: i=1; AL+hErHjO1eqdwKw4FTILJiuowKChilrf81s/OYfkYgBNoKAVbn42VOor6TYzwLBhm1B0nTW/NBCOTlc7rKg5wHWVA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8PR8pXEUP5vWikaduAxobSmcHKhVQFsJcsOI1++GVi1ZPhRFRy
	pilOvW8e/ZIjFw9ZOzJxvHjizK/L8R10sOS5Zm7KJttXEnttjL48X2kyyaDoyuaK+okWaUuSE+u
	nAxanf1vqcDTWuo/ZtdAnoTZ+rhbOtsTWDF6DfcUDUsv03i2iUr8o4Uym1Mum
X-Gm-Gg: AYBFou2tPTk3UXiYn+wqHmWZUqNDDF2QGHcGJ+v2D1b4NhOXxivvdNySQ633+cmh8Y1
	pLlR83JA2U/UPW+kvBahtcfHXv2IlZ8jU3+U7dGuLEXUeQXWUbhuY33z+jg8rLtWOZwf2DgmPrA
	7EGQ+UDI5Vgvh7ECFiDuAgZj+J8SqO6QwXe9BYqZKG6qT0HxjfLOtmwaKE8/3pgcWSnYlAR2cTS
	bKlCV2OraiMjdKTf3LwNjmoRCbkqDTi/NUqv05MY844KCauRLVYYn2D+sqyJ/hRhYqrQUZ73rT8
	q05MOafvwODv33DaTGRFqTiuwOtL+OmObL1V1mk4bSkJYrnfXPfpGbGaWzXMEvMonaxZ7W9hUFL
	DKztRKRYZq/ZB56yYdWk6AXtVqhKMUGXyI7TQ7fDx8z+Y/pl4J9oR7d1hccivooquCc44y5QpIz
	jMoMslo+hPhwy1bmpiflFKrgiXR6WTd+dVjg9S4TjkEtexV83RNg==
X-Received: by 2002:a05:600c:4504:b0:4ba:7e6:53d6 with SMTP id
 5b1f17b1804b1-4bb7da52ad6mr61041225e9.33.1795023599827; Wed, 18 Nov 2026
 09:39:59 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118012321.2861920-1-wolf@pi0.com> <2ec2efe9-b3dc-4757-85c3-528642ea57ff@oss.qualcomm.com>
In-Reply-To: <2ec2efe9-b3dc-4757-85c3-528642ea57ff@oss.qualcomm.com>
From: Jonathan Wolf <wolf@pi0.com>
Date: Wed, 18 Nov 2026 08:39:23 -0900
X-Gm-Features: Aa3M54pPxvUAq6HMdagxpMC5cxexw9wJ5sM6AWKWY8bBvmK12hLzWm9b3yEHzx8
Message-ID: <CAByFygUwwTx514cAv-i+Nk3enfECtx4NeY-o5PXjGtqG0QYHug@mail.gmail.com>
Subject: Re: [PATCH ath-current] wifi: ath12k: parse nested DBS/SBS capability TLVs
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	jjohnson@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review, Baochen.

I=E2=80=99ve moved Tested-on above the official trailers and added a warnin=
g
when parsing the DBS/SBS capabilities fails. I=E2=80=99ve also moved the
cutoff assignment and debug print into the DBS/SBS parser helper so
the driver only updates the cutoff after the full array validates.

I=E2=80=99ll retest on the Steam Frame and send v2.

Jonathan


On Tue, Nov 17, 2026 at 11:04=E2=80=AFPM Baochen Qiang
<baochen.qiang@oss.qualcomm.com> wrote:
>
>
>
> On 11/18/2026 9:23 AM, Jonathan Wolf wrote:
> > The DBS/SBS capabilities in WMI_SERVICE_READY_EXT2_EVENTID are carried
> > in a WMI_TAG_ARRAY_STRUCT containing nested TLVs. The array pointer
> > therefore points to an inner TLV header, not directly to struct
> > ath12k_wmi_dbs_or_sbs_cap_params.
> >
> > Casting the array pointer to that structure reads hw_mode_id as
> > sbs_lower_band_end_freq. On WCN7850 firmware advertising hardware mode
> > 5 and a 5900 MHz cutoff, the driver consequently records 5 MHz as the
> > cutoff. This produces invalid SBS ranges such as 4900-5 MHz and makes
> > a 5/6 GHz MLO pair appear to occupy the same hardware MAC, triggering
> > partner-link deactivation.
> >
> > Iterate the nested capability TLVs with ath12k_wmi_tlv_iter() and rejec=
t
> > unexpected tags and payloads shorter than the capability structure.
> > Use the first record, matching the vendor host extractor, and leave
> > the cutoff at zero when the array is empty. Only store the cutoff
> > after the complete array has been validated. This leaves the existing
> > hardware-mode and link-selection policy unchanged.
> >
> > Tested this parser on a Steam Frame with WCN7850 hw2.0, applying the
> > patch to Valve's matching 7.2 kernel source. MLO advertisement and
> > radio-mapping diagnostics were enabled separately. The cutoff changed
> > from 5 to 5900 MHz, the 5200/6135 MHz links mapped to separate MACs,
> > and AP-side data counters increased on both links during traffic.
> > No driver recovery or association loss was observed during the test.
> > An unmodified upstream kernel was not boot-tested.
> >
> > Fixes: 241d130f1419 ("wifi: ath12k: parse and save sbs_lower_band_end_f=
req from WMI_SERVICE_READY_EXT2_EVENTID event")
> > Link: https://github.com/pi0code/frame-mlo/blob/main/results/final-pars=
er-live-test.txt
> > Tested-on: WCN7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_V1.0_V2.=
0_SILICONZ-1
>
> Tested-on: is not an official tag so we usually have it at a separate lin=
e before official
> tags:
>
> <leave a blank line>
> Tested-on:
> <leave a blank line>
> Fixes:
> Link:
> Signed-off-by:
>
> > Signed-off-by: Jonathan Wolf <wolf@pi0.com>
> > ---
> >  drivers/net/wireless/ath/ath12k/wmi.c | 24 +++++++++++++++++++++---
> >  drivers/net/wireless/ath/ath12k/wmi.h |  1 +
> >  2 files changed, 22 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wirele=
ss/ath/ath12k/wmi.c
> > index 75b259990..f43c9a359 100644
> > --- a/drivers/net/wireless/ath/ath12k/wmi.c
> > +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> > @@ -5781,11 +5781,25 @@ static int ath12k_wmi_update_hw_mode_list(struc=
t ath12k_base *ab)
> >       return 0;
> >  }
> >
> > +static int ath12k_wmi_tlv_dbs_sbs_caps(struct ath12k_base *ab, u16 tag=
,
> > +                                    u16 len, const void *ptr, void *da=
ta)
> > +{
> > +     const struct ath12k_wmi_dbs_or_sbs_cap_params **first =3D data;
> > +
> > +     if (tag !=3D WMI_TAG_DBS_OR_SBS_CAP_EXT || len < sizeof(**first))
> > +             return -EPROTO;
> > +
> > +     if (!*first)
> > +             *first =3D ptr;
> > +
> > +     return 0;
> > +}
> > +
> >  static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
> >                                        u16 tag, u16 len,
> >                                        const void *ptr, void *data)
> >  {
> > -     const struct ath12k_wmi_dbs_or_sbs_cap_params *dbs_or_sbs_caps;
> > +     const struct ath12k_wmi_dbs_or_sbs_cap_params *caps =3D NULL;
> >       struct ath12k_wmi_pdev *wmi_handle =3D &ab->wmi_ab.wmi[0];
> >       struct ath12k_wmi_svc_rdy_ext2_parse *parse =3D data;
> >       int ret;
> > @@ -5840,9 +5854,13 @@ static int ath12k_wmi_svc_rdy_ext2_parse(struct =
ath12k_base *ab,
> >               } else if (!parse->htt_msdu_idx_to_qtype_map_done) {
> >                       parse->htt_msdu_idx_to_qtype_map_done =3D true;
> >               } else if (!parse->dbs_or_sbs_cap_ext_done) {
> > -                     dbs_or_sbs_caps =3D ptr;
> > +                     ret =3D ath12k_wmi_tlv_iter(ab, ptr, len,
> > +                                               ath12k_wmi_tlv_dbs_sbs_=
caps, &caps);
> > +                     if (ret)
> > +                             return ret;
>
>
> better to leave a warning before return
>
>
> > +
> >                       ab->wmi_ab.sbs_lower_band_end_freq =3D
> > -                             __le32_to_cpu(dbs_or_sbs_caps->sbs_lower_=
band_end_freq);
> > +                             caps ? le32_to_cpu(caps->sbs_lower_band_e=
nd_freq) : 0;
> >
> >                       ath12k_dbg(ab, ATH12K_DBG_WMI, "sbs_lower_band_en=
d_freq %u\n",
> >                                  ab->wmi_ab.sbs_lower_band_end_freq);
>
> to follow the convention, would be better to move the sbs_lower_band_end_=
freq cache and
> debug print into the parser as well
>
> > diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wirele=
ss/ath/ath12k/wmi.h
> > index b508aa759..94bb6854b 100644
> > --- a/drivers/net/wireless/ath/ath12k/wmi.h
> > +++ b/drivers/net/wireless/ath/ath12k/wmi.h
> > @@ -2032,6 +2032,7 @@ enum wmi_tlv_tag {
> >       WMI_TAG_PDEV_SET_BIOS_SAR_TABLE_CMD =3D 0x3D8,
> >       WMI_TAG_PDEV_SET_BIOS_GEO_TABLE_CMD =3D 0x3D9,
> >       WMI_TAG_PDEV_SET_BIOS_INTERFACE_CMD =3D 0x3FB,
> > +     WMI_TAG_DBS_OR_SBS_CAP_EXT =3D 0x400,
> >       WMI_TAG_RSSI_DBM_CONVERSION_PARAMS_INFO_FIXED_PARAM =3D 0x427,
> >       WMI_TAG_RSSI_DBM_CONVERSION_PARAMS_INFO,
> >       WMI_TAG_RSSI_DBM_CONVERSION_TEMP_OFFSET_INFO,
>
