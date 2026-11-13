Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558285;
	b=QWdj3cO3OCg31I+ZxTuPjbkulmJd8tFohaDNdDHnKWOUp/ITkwa5fDyZYXAnY7JnwHq3
	 A/AcFiRxSfHMzO4mjFMVqKqDn++TC52z0ulv/11wPCa1VdAhQil/x9fFKF5fsTPpATcaq
	 LQrTZUSF9oSzA9RD6ZU2DwaksOGmUaNzYcJXHzQxCLadwZsQ1vUKSWuRD6ytr90A4iTiJ
	 9y/D/8rIG/dnsZH7EbFWsre7XXeQRkmtGMW3zhVzm7OshoygdMwgOkFIrkvVLTc9VJ/8/
	 5oJefY3XYBd5IUnWcY+BEoQAROCqn9nhBemR8nRP8w62L/Yu8P9ZacMmlMzDWg3hrRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558285;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=u834RZJVTQCr3QYeqIbcaqmMcY2CuFC2Fs3TwC5yvdE=;
	b=rlcVZEcTWHqyxULYCBQl1eBexqzxltl8u5xa9P5LWykcplN5UYBTTDcDuskozt5+Yhud
	 50Dqzt/zZWjTbmQ+DPYT3JGgmm8ntgS06qqmqheKWqvdAV/gOxo1q1Swpo7kd2NyySUmY
	 dUs+LrGf9u+3LVosuMYjGFoSdQmn1peM1zYFLEnNZjEGF2dtrLWxm02g+X9uK2kEVb3kg
	 pcu5jrSiDaPaieEUryA+2zqz2fo6l20N10uzx3+gWVgzp1brwucCDRQu0w7lFS2zgKjbd
	 1Vmzv0GD+7TVb588Nn8HQp/X9MgNip/5k8QeDaoBBrMdA+DG0dbNPDhXdL6W4+p8PKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=a8yxkgWa;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ABF606A327
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 08:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90ABF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=a8yxkgWa
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AD8OetZ6603093, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794558280; bh=u834RZJVTQCr3QYeqIbcaqmMcY2CuFC2Fs3TwC5yvdE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=a8yxkgWarXD0O6NA0ZCmxIXndefcPKQCvCod6bc2Ujw96kud4a6YmfGUQsDInxiZB
	 JcBzAzC1PDrvanxa+pQR9bMaYqT/h9LAGda00L86XmQoXMAIlWImamCHX5gaG1g6Vp
	 g2Mj180DmQY6iHE8DvDJn9+8t9dy3Tqp2AEmgMhiH4WstBxBqgs7WsHEoM7iuNwlqj
	 NN1DiD14ALm5xEEcGnzPl5E9C+3b1iMZF3Fsmp/NZPyhRllgLpDmEHHeMIw+VscQDh
	 Y5Y9XrNI7XuRqhu7DcJJmtorvdIBnsX2BPxRwtVZMfg1YC6Y1XwVg5T3I90R1iUrhi
	 DIKW5vhBUO4fw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AD8OetZ6603093
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 16:24:40 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 16:24:39 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 16:24:39 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Fri, 13 Nov 2026 16:24:39 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Vincent Schurink <spam@acio.nl>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH rtw-next v3] wifi: rtw89: set RA init rate level when the
 station RSSI is known
Thread-Topic: [PATCH rtw-next v3] wifi: rtw89: set RA init rate level when the
 station RSSI is known
Thread-Index: AQHdc0YlUf9eQmeiD0qR+cPoa7qFpLcrqBfg
Date: Fri, 13 Nov 2026 08:24:39 +0000
Message-ID: <4985719de8b5439e8484384ed52033e1@realtek.com>
References: <20261113080731.30155-1-spam@acio.nl>
In-Reply-To: <20261113080731.30155-1-spam@acio.nl>
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


Vincent Schurink <spam@acio.nl> wrote:

[...]

> @@ -747,14 +765,8 @@ void rtw89_phy_ra_assoc(struct rtw89_dev *rtwdev, st=
ruct rtw89_sta_link *rtwsta_
>=20
>         rcu_read_unlock();
>=20
> -       if (rssi > 40)
> -               ra->init_rate_lv =3D 1;
> -       else if (rssi > 20)
> -               ra->init_rate_lv =3D 2;
> -       else if (rssi > 1)
> -               ra->init_rate_lv =3D 3;
> -       else
> -               ra->init_rate_lv =3D 0;
> +       ra->init_rate_lv =3D rtw89_phy_ra_get_init_rate_lv(rtwsta_link);
> +       rtwsta_link->ra_rssi_unknown =3D !ra->init_rate_lv;

Not only RSSI 0 but RSSI 1 can fall into this case, but I think it is harml=
ess.

How about put into ra-> instead of rtwsta_link-> ?

Please put it on bottom with a comment like below, because the struct rtw89=
_ra_info
is a copy of H2C command (at initial version).

@@ -5235,6 +5235,8 @@ struct rtw89_ra_info {
        u8 macid_msb:2;
        u8 band:2; /* enum rtw89_band */
        u8 is_new_dbgreg:1;
+       /* driver helpers */
+       bool rssi_unknown:1;
 };


>         ra->upd_all =3D 1;
>         rtw89_debug(rtwdev, RTW89_DBG_RA,
>                     "ra assoc: macid =3D %d, mode =3D %d, bw =3D %d, nss =
=3D %d, lv =3D %d",
> --
> 2.53.0

