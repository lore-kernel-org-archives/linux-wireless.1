Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795397005;
	b=hz+BZRwCRbRkdPXTQ3J68zZ94V2pxVKX2IaYiC74JNX+TwoyD2e8H9dCRZ+vyQdOyglC
	 SFclQaHeiCO8/tl0Y/eDDlOnNrv+0RnMH1ZXQgmuKq+opxDQ9S4qwVv4ViQlUW7sAm5dF
	 nHVEqrqRIuVaFNS1ZTVHiRh//gcl7TraPn37PPAqHHiEaDlLG9cP9ZEXfi8oCWdJIGT+Y
	 P3m+CJ8xndiLd7cOlexPHOxFXaienJrrn5imBDNn0aU6MSDXl/j5mxmUQFG1Zs9Xqt4FE
	 wayrR8TDz63TIZtP2EU8WbZIzIb5Kxp+z7yDZ87dMUHQUadqXasCqFS84JmXXgrGC1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795397005;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=F0fCSYAHYES9SH9Bd4Qj9ju08eQgcjJVL+2EL1/jyWk=;
	b=K7z0XDnQwU7MIrJTBYkjiO98GigvnMEXkSUrhR3mlMuWzErWcZ/EDE5Rg2WvXpJug7uM
	 0iRW5SZ3LJQ17ABRvz4y+ucKJNhdqJTo+hBe9oU7ha+q1qi2yFGh/Uv3Y/WVisjKzxTNb
	 2bLOB1/tbXKAN4VVzaao9eYdwtYPA8hPXVbcTr8T2HJ1kemNjdK2+AXXCRnUpTGMDp+z5
	 2OMfmCTY54tsEmWARV+48kyn1aw/UQjT8E7s1ojOJl7HEchRsccaiZVytysKiY8VA/nXr
	 uh863A5rM8fDO5OuVGRDdfOIkqqFCXuWda+VZb4THhEXFYTe3g81dgxwuqxl6LyJkIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=jI7ij8ID;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAD8606A31A
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 01:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EAD8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=jI7ij8ID
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AN1NKVr81188787, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795397000; bh=F0fCSYAHYES9SH9Bd4Qj9ju08eQgcjJVL+2EL1/jyWk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=jI7ij8IDLccgP7LQ4iE0ykNNH6LMU63uwckIdbyLZ9ueV8vTwkw1IYxgj4oMxMZCM
	 Cv5WgkuQnsIHmIXM151BoDUVIPc6eHBYgg5PCjQVRllAkJGi9z05S9ApVGjGl7fTps
	 cvKH98TPgsv2PV4fTYf/2qAR2py92CQfhqXK82eiLNDPBUt5EGw5Rc83ycZ8kFI5IK
	 iCA8spSN07jFufymmsKKvUYtYeNtqkvNT1tOLsY6mSwzDy/QKTxrlhqhi2YND928/D
	 e8QGYILqPyUslpT/oGXUHDeNi+1MCN1nBD89glaQx9RY2OZMxvwSaqT8GBqNGaLk/p
	 OwyHPk4M9qSLQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AN1NKVr81188787
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Nov 2026 09:23:20 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 09:23:20 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 23 Nov 2026 09:23:20 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Josef Schlehofer <pepe.schlehofer@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH rtw-next] wifi: rtw89: debug: fix diag_mac crash
Thread-Topic: [PATCH rtw-next] wifi: rtw89: debug: fix diag_mac crash
Thread-Index: AQHdet9WzCGQWJx5ik6csXlw9EBbGbc63GMA
Date: Mon, 23 Nov 2026 01:23:19 +0000
Message-ID: <1f89e4c0724449fcb77ab321c3115972@realtek.com>
References: <20261123001225.13076-1-pepe.schlehofer@gmail.com>
In-Reply-To: <20261123001225.13076-1-pepe.schlehofer@gmail.com>
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

Josef Schlehofer <pepe.schlehofer@gmail.com> wrote:
> @@ -5257,7 +5257,7 @@ static ssize_t rtw89_mac_diag_iter_all(struct rtw89=
_dev *rtwdev,
>  {
>         const struct rtw89_fw_element_hdr *elm =3D rtwdev->fw.elm_info.di=
ag_mac;
>         u32 n_plains =3D 0, n_rules =3D 0, n_positive =3D 0, n_ignore =3D=
 0;
> -       char *p =3D buf, *end =3D buf + bufsz, *p_rewind;
> +       char *p =3D buf, *end =3D buf + bufsz, *p_rewind =3D NULL;

With fixes of prev_{seq, sheet}, is it still needed to set p_rewind =3D NUL=
L?
(Though it is harmless).

>         const void *rule, *rule_end;
>         u32 elm_size, rule_size;
>         const void *msg_start;
> @@ -5325,11 +5325,11 @@ static ssize_t rtw89_mac_diag_iter_all(struct rtw=
89_dev *rtwdev,
>                         break;
>                 }
>=20
> +               prev_seq =3D seq;
> +               prev_sheet =3D sheet;
>  next:
>                 n_plains++;
>                 rule +=3D rh->len * 4;
> -               prev_seq =3D seq;
> -               prev_sheet =3D sheet;
>         }
>=20
>         if (positive_bmp) {
> --
> 2.54.0 (Apple Git-157)

