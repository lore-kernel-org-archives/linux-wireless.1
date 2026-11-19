Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795073764;
	b=OA13tUv+5Sfqvo/RlGgMmOgNZ8HhzNlpsclTheRDwqWPmwOt+KjhkVuatKSdt9tOe4Wu
	 MGVEqHwK3MxE4/wTgcPFI9Rt8DQ5nVN6dmR0u8n/IcVgq/5Artgo9mDqbIukh81MUtej7
	 jQvLHB31/IZPfPLoY/qYs9zhHCs5IXA/oOdeEF77/GYpzio8SFl2x7k7eVL8FhCriLgxu
	 7E44StGotFQ7ia9Y7L7fFkK6lKKEFFic+yU8hSSmfMJDqNNGWjjVacOOZQd94v+wvFwU0
	 jsu197LYgItqAz1BE/FwMiczUH3q9oztXGTa5jqExF12o1mWOx0EkyHMqIjqiUP+JcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073764;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=iDlqfbRGCcxCnlDffN58Lg3i4F8GrTEA+9vlNJdaw5o=;
	b=ZkL6L8GRtXVMR06hYix4kJuBexuhdkdRqeI3AmrPqat0P0BqudBBrAHGXsTLRwgSCVxJ
	 phMNbI3QKFESDUig0iTqWCFNIv56GfcWQlJKiqk+Uj7QwYlZE9igIsMDudtyDO+cOFKAq
	 bnWHzK+hAE4DLFGq4rloTnU7c2QjrrFvB5O4nFgOkCGrjpb/ya6OrC/Q6mvhFiENaVZNN
	 +j5wuHUobeXiLwHqdvSfLy6DV3a+/x45NwGAk/OIjNv0clJv9VFrbwoffpJ5KviODMfrC
	 fTSM+un0gLds+RQrBGOUNw4hmodH5SrPpm2XxCWJy6uozG8e976uAA7rkrfpfPcJ1nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=ihmz5YP0;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA35606A333;
	Thu, 19 Nov 2026 07:36:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DA35606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=ihmz5YP0
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AJ7ZvM322109980, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795073757; bh=iDlqfbRGCcxCnlDffN58Lg3i4F8GrTEA+9vlNJdaw5o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=ihmz5YP0LIJnFrHMGrXgtKtyyOgmi1A5NzdaVBo/iqQu+WdAlHyjEVur0d+z5b5MO
	 LqLBN9elPNCEbmdUCJ/t7VRzyD2W99Hm/RfcPEhkyBa/0sLPJJJFNHzaZsMebo7CXJ
	 fhwb/wLm3nm/wa6pqXijvz5YE1MJfupDtRS87OanhVZjp6FApIJs0qXVjc3KxWVAT7
	 JFOTjCpcQGb5SmhRqyuuCG3JKFsIhsJIwWblNRd8UiZB4/J5MbnLzq8y+EuhXFXbwg
	 cmSiuQoqGi36GN3eIwfu2h1PBBXRMvyaS7WWwVeUOPzLGcAEXccItVhNmw/jVnpQEy
	 0m0vvC9AGPSLw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AJ7ZvM322109980
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Nov 2026 15:35:57 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 15:35:56 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Thu, 19 Nov 2026 15:35:56 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Enver Ikromov <owner@ph4ntom-rev.uz>
CC: Zong-Zhe Yang <kevin_yang@realtek.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v7 4/5] wifi: rtw89: avoid reading seq_ctrl on
 control frames
Thread-Topic: [PATCH rtw-next v7 4/5] wifi: rtw89: avoid reading seq_ctrl on
 control frames
Thread-Index: AQHdd4fEzD3UxuxQ+kyNsCQjLiwnnrc1Abew
Date: Thu, 19 Nov 2026 07:35:55 +0000
Message-ID: <cf14171662124572aba77ebf2adddd08@realtek.com>
References: <20261118180435.904-1-owner@ph4ntom-rev.uz>
 <20261118180435.904-5-owner@ph4ntom-rev.uz>
In-Reply-To: <20261118180435.904-5-owner@ph4ntom-rev.uz>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Enver Ikromov <owner@ph4ntom-rev.uz> wrote:
> Injected 802.11 control frames such as 10-byte ACK/CTS or 16-byte RTS
> do not carry a sequence control field and are shorter than a 24-byte
> 3-address header.
>=20
> Set seq to 0 for control frames instead of reading hdr->seq_ctrl.
>=20
> Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
> ---
>  drivers/net/wireless/realtek/rtw89/core.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wire=
less/realtek/rtw89/core.c
> index 8333b26..e599058 100644
> --- a/drivers/net/wireless/realtek/rtw89/core.c
> +++ b/drivers/net/wireless/realtek/rtw89/core.c
> @@ -1317,7 +1317,10 @@ rtw89_core_tx_update_desc_info(struct rtw89_dev *r=
twdev,
>         else if (tx_req->vif)
>                 desc_info->mlo =3D ieee80211_vif_is_mld(tx_req->vif);
>=20
> -       seq =3D (le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_SEQ) >> 4;
> +       if (ieee80211_is_ctl(hdr->frame_control))
> +               seq =3D 0;
> +       else
> +               seq =3D (le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_SEQ)=
 >> 4;

Please add a blank line to v8.

>         addr_cam =3D rtw89_get_addr_cam_of(tx_req->rtwvif_link,
>                                          tx_req->rtwsta_link);
>         if (addr_cam->valid && desc_info->mlo)
> --
> 2.56.0.windows.4

