Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794399558;
	b=ab22lmyt/qDpjBbuk2LbviFf/T1Bd38Fuq0zwrq3PCvbdTCNH2q9EpFi9TKUsXLXJrwC
	 sFbxhr+XPoAo9kquuAXQZs4pruQV0x60KW5B+Z7ZrZju6vao7T9NzuFTMdDgMHe8PMO7r
	 +UklpoPjCwD8JzTV5ErE3C7H6k3eynxQxd7u7xHGe4A71QPZh7N4ETrBm2/57pcIeuyFS
	 oSdSrWE2foB28KcRHbslElSYVHdVaNzkTna9Twk0u6x1YpVLCoCtaL7p1T55uWQ+M+T1K
	 YiXoWFrYQvkqgiEKbSVdtRhlbsm6ZeVzwbysqoH3Pnt+lqJ63HX4lBLTJeKZtylhmaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399558;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Z1TCNs1smOCp3Z56q7h6cFW/kToZwEK3IDBGLcQoIJ0=;
	b=AgLpd+XQtoFSHuBqWURcyYaD3GG/QHkbZVlB2uoj+t5Zc2XOFjtOU4Ap5rVMqxru/lSa
	 6dugPlspCmC+5aD39beMn3nU4lwG2z4qFZgw7THDBmcCas0EkyPaQGVX7kXl6MKWpPRHV
	 MooBH80b4OwCIsYkwHeVLTaPvND3AD8qG7nrV794OztbVHqxpxTGpwmm/s6Hk228T16hX
	 ogYAZOgjLxlaLGf6+lJT3QNbJovJ9xaJClD/rkbut5oYKUumujPKl+5faVTlz9SffsNPn
	 yW/7dAWXwA1xAq9om+PRndZddXHDEKCIJ7AeVgoSHYVOpRQQ0qlz6OnszPirzlviVXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hvb+1f5j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MHlQgSn/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E054A606A8B2
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 12:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E054A606A8B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hvb+1f5j;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MHlQgSn/
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABANdHp012723
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 12:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z1TCNs1smOCp3Z56q7h6cFW/kToZwEK3IDBGLcQoIJ0=; b=hvb+1f5jwZYKCwEb
	sFVeoXbL/PmuXkm/knPitOedzCAytCOWKB+lxAoiuqSp9ZRqYCFG+C65Sk623pVA
	pGEdZ2F0NmNeNiJSE10oHM3wctp1zuDDLl0qkMZoDlHm8x/KDjqHaeF+uAXpbwgl
	oadUfofG8+Fdm3ac9uIlc59N7m8XKOYyyjVtqeS2Oh4cO5bxp0RkpOs75VgDjMmO
	9sMs8iuU641GyoOGAl6TCxWFApRntYCvtBqimmye144DJ2b+TdHbnHhuQSh+xsp8
	Ysdx1hyOYPngeZbJgJQ4sxuwlfom+NtqbdWUNj9H/hiK+LGEODxxPg14BPddZwSz
	XGaSbA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvpjjre6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 12:19:16 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc10da5ad4so721668137.2
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 04:19:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794399556; cv=none;
        d=google.com; s=arc-20260327;
        b=q0AlAewneoU0eRIYLsmW1VVqrVIFdQKWEODaRoSctGSqiNbp4g5cP+DF6WvZnngG+N
         nVhu65J2CyQtRN7YpyolGBDVLytQBzasG0KZHlD3zpXWSPyAN2jh1JWgNftN5mMDlCP+
         uaagdxDjzvQ1wCnmeE19cWJHq0kYl1/bw9bSjSqGye2PFWh80eIMq6DSUxDuXiO4UWIt
         tZgIw5m6BkDIMf6SIlRLPa+8bFCSFxojgh7FMdrluzCAlrQpFxDHuLWQ/d8OfeuIawjl
         fozwaETzHX+hiRbj8977opDOooSKw3irEbQTKn03GoY0O6shFAfSshz0G2CZUL7UOQ4K
         lWXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z1TCNs1smOCp3Z56q7h6cFW/kToZwEK3IDBGLcQoIJ0=;
        fh=mftTDOH6k9uIPNw+0NFm2hMnjnGX/hVEt82cLZfwASM=;
        b=Xucd21Y4pn9mSYcJ05ZgWGVz4bpzf/SjlgpwEUJkqVbYPay5pMD2DZGlH4F8V8ahYR
         NR9s4vVibaNRphql7cLBN3fjKX+3/4qjDJJonak6lbbYkCDT5ZBDAH84WY0maOehYw4I
         qwXAGEeANwVKsZf6kg5ZilmT3/2RsI+0YdeiUewgbk0tpn048SppgUh/krf89rHmxf+n
         H8BjFh2f7sgMan5nMDfHNinMRS9A1A75L/arhWaAwv/0ninJrq/CT1OwTpog8dG/2w9h
         yHVeVFJtbYhlKN7YbPxChw3cMsAk4NDVkIEItW8s+TceaHz84a1Ku847RtoWR4FMhd5n
         87YQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794399556; x=1795004356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z1TCNs1smOCp3Z56q7h6cFW/kToZwEK3IDBGLcQoIJ0=;
        b=MHlQgSn/qc0TU3pjyhcQ2egydg6FlkU2muvMQwQ8KWxSODaDjZttFq4II9LlZ6zkaW
         7LdTRQ2oXTk68pi96roLl7L0smRVGrgdQvW0IKPoQVTMaHRORTlbbfE0KEg4B/osjDAg
         MBqX6SVwcJZbXgCl7HekYFy3Og43bmjyhL5bdgza2vdvXK64Pt3w0Ejrt5Y+b5NUAVAX
         LjjauVM3o+WpZVzZnF9ys1v2APaQvaptHqkNMAayzC0NkDfi+WbPb0NMT9cmZsHtb+jl
         HiQJ1FqXe5xXvsv1kdk8O5Y1UjTTMhkKV0Ed8nD+KpFou9C0eovjGfjsOhq4tJfudW+i
         0FLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794399556; x=1795004356;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1TCNs1smOCp3Z56q7h6cFW/kToZwEK3IDBGLcQoIJ0=;
        b=a/sTRzcn46O5735kDEBMCol8cZ45BaAw5XjsWZTNj/d3Ul+4ZG9NJsf2DLWtFBTN+D
         sJ+uX3bCQh1dHmeWfx35w4NuHzpA75KW2w4wT7EpJN3PAb4lH5WTLvnE6NnMfiz0PSgC
         lxSrvy0qtGqjjTL1JS8k1y5/864j5JmkOOrj2yWRSUEO0ZDu1K+l1mTlC6qBrPx8a8xI
         MMJEoTKlIMDloVPRy/bBVRDsj2Gjx3U3UeZ7Ni40Hv/n6IJjrnAZZD9aeaHbm47r9GXD
         iV/+rx8c/QTWP7aqG9rIRIdhGyQPGeCHjo2b2IBlGLTEtbZmS7/mtO2wtPNuTY+XP6DU
         MLGg==
X-Gm-Message-State: APuU4Z+gywQoJbwWKjlby0iRlrXeUwP+i9HSE5Bef46Bu4lpnAFsrJVq
	vGGR0ytJlLOWa5jYTtI//3ANYqHTNWAXRgliEIrcnZSfAxPlGHZxOFKW6wW2P51aE+cU+Gl2Jvb
	vfCf4c3Bu0gmEj21tvfdfcf4Sx0k7qhpuhIgWaDOHruwRpxD2CHOWwCOdOQJ3iUkswfcW5YWX/O
	r46Nba5IfcYOs6NpZWbCJps9zpMS5W55PI877XdYI9/qa3
X-Gm-Gg: AYBFou3YD8r3Ef3ht1s9g7HEkCl3C0g18kWWeBSg1lcW4VZjvPQjpXJrRUGcaqm5IlW
	Ed4H1cb/NxsN0zf7NpkG3izvXbBTJkifCDCXqzx6SG9eJcWrfGY3DrrU87pECU5p3XeuSDdAKCv
	iAWR77tdv75Wp/4w1c7oU0SPruL/+h4d9WcfCUWCsWA4wE0ueYhMUHHpmbAg==
X-Received: by 2002:a05:6102:6e89:b0:779:5049:87b2 with SMTP id ada2fe7eead31-7d4ed9c43aamr397418137.0.1794399555887;
        Wed, 11 Nov 2026 04:19:15 -0800 (PST)
X-Received: by 2002:a05:6102:6e89:b0:779:5049:87b2 with SMTP id
 ada2fe7eead31-7d4ed9c43aamr397408137.0.1794399555154; Wed, 11 Nov 2026
 04:19:15 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102171603.368298-1-pmazzini@gmail.com> <20261102171603.368298-5-pmazzini@gmail.com>
In-Reply-To: <20261102171603.368298-5-pmazzini@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 13:19:02 +0100
X-Gm-Features: AclHuK9L2i5QMofYq-DCHvqZDWhP-djf1yvf5YQeg9uH5hqyPXlLD5ujeUlfzIg
Message-ID: <CAPx+jO9uDvEyrT9ij3Rrb0=rmKzn+TK4AH1zqrM1Gz=_eW2pfQ@mail.gmail.com>
Subject: Re: [PATCH wireless-next 4/4] wifi: cw1200: add XRadio XR819 support
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: linux-wireless@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0OCBTYWx0ZWRfX7Pii1xZq4qi7
 WgjJKfxG62hLNw6U2bx9fc4rJGmy18+syKehlaDxzCOON+fUNciV+6MIyWbTiPIn17Cg5pQhlI9
 J1TFGzsXJcVifP7gKggx8p5u5q0tTr9uG+wuMjkXBwcIcbkbpT74Y6+J1pjoUT+Txy7C8kfJ+Zp
 gOEHUSowGJ0yAk7jxPPs8TSeJ82nICPjta0y/Ny4/UXXDUnYKL10YxVi1ANKBtACF6G+wKnc5gr
 XolgXUmRVSQi84vknQbxW7b1clql9egg6ix2vglgSKok9MgHYbezrpGJ194gqYkCMMsJsA3jIdQ
 IZxJ7umuCHgIPZ7qY8JDE4gQUlIQn4cBtI7Io4Eiawghj4znt7NzkYXp+4+2QGQbSnMsXGn7/VO
 cLhaqjAkOdcTkCFAOJ8ty4JejcMvGD3WdOZxYQlZKDPFvxzm1lKLnaoQol14Gck2S47VRQpDbbx
 aDCCfKprV8iduH4tQBQ==
X-Proofpoint-ORIG-GUID: _gwq6HoeYV_0J3VbJ7FxnNHtI9fes2mz
X-Authority-Analysis: v=2.4 cv=FeuiV5+6 c=1 sm=1 tr=0 ts=6af45d44 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=4gwp0c1PgdtURhtzPC4A:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: _gwq6HoeYV_0J3VbJ7FxnNHtI9fes2mz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0OCBTYWx0ZWRfX7n5erqzTcKzI
 udZYb+I8hlBhQZBddCG7fWOqt2/dFjeYu7HUyiNV6wu1ZEv472KvfdvG9BEAtJhR4mClDtoyE/D
 a4x9VpVgQDvSFAmRgl27brMCk9seCUw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110048

On Mon, Nov 2, 2026 at 6:16=E2=80=AFPM Pablo Mazzini <pmazzini@gmail.com> w=
rote:
>
> The XR819 uses the ST-E SDIO vendor ID with device ID 0x2281 and
> reports itself as a CW1x60. It starts from a bootloader written into
> its memory, then takes the usual firmware download. Its modules run
> from a 24 MHz reference clock.
>
> Give the CW1x60 entry the XR819 bootloader and firmware, and load the
> bootloader instead of the NOP instruction.
>
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>

Please funnel this via the wireless tree.

Acked-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
>  drivers/net/wireless/st/cw1200/Kconfig       |  3 +-
>  drivers/net/wireless/st/cw1200/cw1200_sdio.c | 13 ++++-
>  drivers/net/wireless/st/cw1200/fwio.c        | 58 ++++++++++++++++----
>  drivers/net/wireless/st/cw1200/fwio.h        |  7 ++-
>  include/linux/mmc/sdio_ids.h                 |  1 +
>  5 files changed, 66 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/net/wireless/st/cw1200/Kconfig b/drivers/net/wireles=
s/st/cw1200/Kconfig
> index 03575e9894bb..9404e318137c 100644
> --- a/drivers/net/wireless/st/cw1200/Kconfig
> +++ b/drivers/net/wireless/st/cw1200/Kconfig
> @@ -3,7 +3,8 @@ config CW1200
>         tristate "CW1200 WLAN support"
>         depends on MAC80211 && CFG80211
>         help
> -         This is a driver for the ST-E CW1100 & CW1200 WLAN chipsets.
> +         This is a driver for the ST-E CW1100 & CW1200 and the XRadio
> +         XR819 WLAN chipsets.
>           This option just enables the driver core, see below for
>           specific bus support.
>
> diff --git a/drivers/net/wireless/st/cw1200/cw1200_sdio.c b/drivers/net/w=
ireless/st/cw1200/cw1200_sdio.c
> index 2b6afe221268..3db937785cab 100644
> --- a/drivers/net/wireless/st/cw1200/cw1200_sdio.c
> +++ b/drivers/net/wireless/st/cw1200/cw1200_sdio.c
> @@ -35,6 +35,12 @@ static struct cw1200_platform_data_sdio sagrad_109x_ev=
k_platform_data =3D {
>         .sdd_file =3D "sdd_sagrad_1091_1098.bin",
>  };
>
> +/* XRadio XR819 modules, with a 24 MHz reference clock */
> +static const struct cw1200_platform_data_sdio xr819_platform_data =3D {
> +       .ref_clk =3D 24000,
> +       .have_5ghz =3D false,
> +};
> +
>  /* Allow platform data to be overridden */
>  static struct cw1200_platform_data_sdio *global_plat_data =3D &sagrad_10=
9x_evk_platform_data;
>
> @@ -51,6 +57,8 @@ struct hwbus_priv {
>
>  static const struct sdio_device_id cw1200_sdio_ids[] =3D {
>         { SDIO_DEVICE(SDIO_VENDOR_ID_STE, SDIO_DEVICE_ID_STE_CW1200) },
> +       { SDIO_DEVICE(SDIO_VENDOR_ID_STE, SDIO_DEVICE_ID_STE_XR819),
> +         .driver_data =3D (kernel_ulong_t)&xr819_platform_data },
>         { /* end: all zeroes */                 },
>  };
>  MODULE_DEVICE_TABLE(sdio, cw1200_sdio_ids);
> @@ -295,7 +303,10 @@ static int cw1200_sdio_probe(struct sdio_func *func,
>
>         func->card->quirks |=3D MMC_QUIRK_LENIENT_FN0;
>
> -       self->pdata =3D global_plat_data; /* FIXME */
> +       if (id->driver_data)
> +               self->pdata =3D (const void *)id->driver_data;
> +       else
> +               self->pdata =3D global_plat_data; /* FIXME */
>         self->func =3D func;
>         sdio_set_drvdata(func, self);
>         sdio_claim_host(func);
> diff --git a/drivers/net/wireless/st/cw1200/fwio.c b/drivers/net/wireless=
/st/cw1200/fwio.c
> index 1a68ef6ed2fa..6b885fd717db 100644
> --- a/drivers/net/wireless/st/cw1200/fwio.c
> +++ b/drivers/net/wireless/st/cw1200/fwio.c
> @@ -66,9 +66,10 @@ static const struct cw1200_chip cw1200_chips[] =3D {
>                 .firmware =3D FIRMWARE_CUT22,
>                 .sdd =3D SDD_FILE_22,
>         }, {
> -               .revision =3D CW1X60_HW_REV,
> -               .firmware =3D FIRMWARE_CW1X60,
> -               .sdd =3D SDD_FILE_CW1X60,
> +               .revision =3D CW1X60_HW_REV,      /* XRadio XR819 */
> +               .bootloader =3D BOOTLOADER_XR819,
> +               .firmware =3D FIRMWARE_XR819,
> +               .sdd =3D SDD_FILE_XR819,
>                 .sync_join =3D true,
>                 .no_switch_channel =3D true,
>         },
> @@ -85,6 +86,38 @@ static const struct cw1200_chip *cw1200_find_chip(int =
revision)
>         return NULL;
>  }
>
> +/* The bootloader is written word by word into the AHB memory */
> +static int cw1200_load_bootloader(struct cw1200_common *priv)
> +{
> +       const struct firmware *bootloader;
> +       const __le32 *data;
> +       u32 addr =3D 0x08000000;
> +       size_t i;
> +       int ret;
> +
> +       ret =3D request_firmware(&bootloader, priv->chip->bootloader, pri=
v->pdev);
> +       if (ret) {
> +               pr_err("Can't load bootloader file %s.\n", priv->chip->bo=
otloader);
> +               return ret;
> +       }
> +
> +       data =3D (const __le32 *)bootloader->data;
> +       for (i =3D 0; i < bootloader->size / 4; i++, addr +=3D 4) {
> +               ret =3D cw1200_reg_write_32(priv, ST90TDS_SRAM_BASE_ADDR_=
REG_ID,
> +                                         addr);
> +               if (!ret)
> +                       ret =3D cw1200_reg_write_32(priv, ST90TDS_AHB_DPO=
RT_REG_ID,
> +                                                 le32_to_cpu(data[i]));
> +               if (ret) {
> +                       pr_err("Can't write bootloader.\n");
> +                       break;
> +               }
> +       }
> +
> +       release_firmware(bootloader);
> +       return ret;
> +}
> +
>  static int cw1200_load_firmware_cw1200(struct cw1200_common *priv)
>  {
>         int ret, block, num_blocks;
> @@ -136,6 +169,12 @@ static int cw1200_load_firmware_cw1200(struct cw1200=
_common *priv)
>         if (!priv->sdd_path)
>                 priv->sdd_path =3D priv->chip->sdd;
>
> +       if (priv->chip->bootloader) {
> +               ret =3D cw1200_load_bootloader(priv);
> +               if (ret)
> +                       return ret;
> +       }
> +
>         /* Initialize common registers */
>         APB_WRITE(DOWNLOAD_IMAGE_SIZE_REG, DOWNLOAD_ARE_YOU_HERE);
>         APB_WRITE(DOWNLOAD_PUT_REG, 0);
> @@ -143,9 +182,11 @@ static int cw1200_load_firmware_cw1200(struct cw1200=
_common *priv)
>         APB_WRITE(DOWNLOAD_STATUS_REG, DOWNLOAD_PENDING);
>         APB_WRITE(DOWNLOAD_FLAGS_REG, 0);
>
> -       /* Write the NOP Instruction */
> -       REG_WRITE(ST90TDS_SRAM_BASE_ADDR_REG_ID, 0xFFF20000);
> -       REG_WRITE(ST90TDS_AHB_DPORT_REG_ID, 0xEAFFFFFE);
> +       /* Write the NOP Instruction, unless the bootloader runs instead =
*/
> +       if (!priv->chip->bootloader) {
> +               REG_WRITE(ST90TDS_SRAM_BASE_ADDR_REG_ID, 0xFFF20000);
> +               REG_WRITE(ST90TDS_AHB_DPORT_REG_ID, 0xEAFFFFFE);
> +       }
>
>         /* Release CPU from RESET */
>         REG_READ(ST90TDS_CONFIG_REG_ID, val32);
> @@ -483,11 +524,6 @@ int cw1200_load_firmware(struct cw1200_common *priv)
>
>         switch (priv->hw_type)  {
>         case HIF_8601_SILICON:
> -               if (priv->hw_revision =3D=3D CW1X60_HW_REV) {
> -                       pr_err("Can't handle CW1160/1260 firmware load ye=
t.\n");
> -                       ret =3D -ENOTSUPP;
> -                       goto out;
> -               }
>                 ret =3D cw1200_load_firmware_cw1200(priv);
>                 break;
>         default:
> diff --git a/drivers/net/wireless/st/cw1200/fwio.h b/drivers/net/wireless=
/st/cw1200/fwio.h
> index 9925d4bcedda..fb66d564c304 100644
> --- a/drivers/net/wireless/st/cw1200/fwio.h
> +++ b/drivers/net/wireless/st/cw1200/fwio.h
> @@ -14,13 +14,13 @@
>  #ifndef FWIO_H_INCLUDED
>  #define FWIO_H_INCLUDED
>
> -#define BOOTLOADER_CW1X60       "boot_cw1x60.bin"
> -#define FIRMWARE_CW1X60                "wsm_cw1x60.bin"
> +#define BOOTLOADER_XR819       "xr819/boot_xr819.bin"
> +#define FIRMWARE_XR819         "xr819/fw_xr819.bin"
>  #define FIRMWARE_CUT22         "wsm_22.bin"
>  #define FIRMWARE_CUT20         "wsm_20.bin"
>  #define FIRMWARE_CUT11         "wsm_11.bin"
>  #define FIRMWARE_CUT10         "wsm_10.bin"
> -#define SDD_FILE_CW1X60                "sdd_cw1x60.bin"
> +#define SDD_FILE_XR819         "xr819/sdd_xr819.bin"
>  #define SDD_FILE_22            "sdd_22.bin"
>  #define SDD_FILE_20            "sdd_20.bin"
>  #define SDD_FILE_11            "sdd_11.bin"
> @@ -28,6 +28,7 @@
>
>  struct cw1200_chip {
>         int revision;
> +       const char *bootloader; /* NULL: write the NOP instruction */
>         const char *firmware;
>         const char *sdd;
>         bool sync_join;         /* no asynchronous join */
> diff --git a/include/linux/mmc/sdio_ids.h b/include/linux/mmc/sdio_ids.h
> index dfffda3d8002..35789be747a5 100644
> --- a/include/linux/mmc/sdio_ids.h
> +++ b/include/linux/mmc/sdio_ids.h
> @@ -27,6 +27,7 @@
>
>  #define SDIO_VENDOR_ID_STE                     0x0020
>  #define SDIO_DEVICE_ID_STE_CW1200              0x2280
> +#define SDIO_DEVICE_ID_STE_XR819               0x2281
>
>  #define SDIO_VENDOR_ID_INTEL                   0x0089
>  #define SDIO_DEVICE_ID_INTEL_IWMC3200WIMAX     0x1402
> --
> 2.52.0
>
