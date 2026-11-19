Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795055415;
	b=j7R2iEWOj1Mp2o0EJFeXCD8cUtO3K1Qur4ycTjEHHNMYbuonun0moDHyoPOicPRHU1OJ
	 72hL94VIBsE5CtD0goa8NH7G40TOE4+qRdhuhKH3aNS3o8qY7ZUuHFbTXK7WMDIhfMKAq
	 1zvUcPFXzC+tJsxmhMSYpt6I1ZhMx641I2yNHWXHYHX9y+6E+9tXxRN15wJZNiWuoYU+5
	 IJSsTENogXdVxCBFLEYt+DQFqzztYFRfsh/4U6/Gx9u+fH1ThCXSWut/eMCG5YI3FMbiN
	 QOB0e1ZkHqn4K2utn+DqeVKeefz88xUFYDULz/L0crOaB1PIxxIMkoLpd1KLZiqf0AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795055415;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=9fAbtoyPi3c3+kicDgJNOEHhcPYnrZ8MUupquQq/pxk=;
	b=kOOXehURE9IXd6LtuHY9nxae74o1871gFd8us6mRlFv+qVO5sDshXtDIRa4P23sK76rl
	 2dBPRJgoFjbMc4/QlLbqjySpkZ6TyhVIv3814bd90bUgI0nxvtn7IJTO5n9GheFW2eWF6
	 CQD+w4SD3LBR5MLK/R/C8FjBo+cC8DZg7RAhV8TXPIjAd9SI8Qu0uVuK5DIOwkzvIzcuB
	 yfJ4e8Wj2dkktObSJ6rhPxtrxKfHuoVdALNt0nfIJ/uhYH1W1rgtPJ9Xk3TGe0pcoC0Ie
	 vqCnLn44X+AyOJYA2jHg/PuW1D0/+QkQe/BqDAA4PBsK8TIcRt/3S1cvbclbCgQjAKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=SPX0cA+a;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFE4606A31C;
	Thu, 19 Nov 2026 02:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BFE4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=SPX0cA+a
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AJ2TsU421947007, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795055394; bh=9fAbtoyPi3c3+kicDgJNOEHhcPYnrZ8MUupquQq/pxk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=SPX0cA+ahNcSvS5+Ax5Nh1EW3Q6qjClRQEexZ476kDdHRJ0ZEKTF8sg6ZxVkexAES
	 oILgUeX0Sfof5daHOhX5JjKDBko9WHer4IujmiwPLaij+ON7tONg6gEcYjpzvwFZe+
	 ceGRn52oPQIw2E0EoYzlEv37BdTfvifOIcRJJS/q+1Zb39AFfxB6S0i5AsOQwAU6/O
	 a9ZR539l7RlNwlEV0O0e1MwjAYzm8Ry1icIC3OYItw5/ehUZp1f1C6Gp2UmTP5WWr3
	 5iNaIPt80wpNRgSE0XMx1XvkfpCaerWagP88FH8+CHrFC+QXKRD9KsfpddCbB+h+5S
	 lp92w/Iem6Mtg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AJ2TsU421947007
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Nov 2026 10:29:54 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 10:29:54 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 10:29:54 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Thu, 19 Nov 2026 10:29:54 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Shirong Zhao <shxzhaosr@163.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] wifi: rtw89: read the beacon header from the frame data
Thread-Topic: [PATCH] wifi: rtw89: read the beacon header from the frame data
Thread-Index: AQHddyAr0Znqcf5uMkiTIyGfdYmn2rc0oOOg
Date: Thu, 19 Nov 2026 02:29:54 +0000
Message-ID: <18e2bb0a73414b528db9741eb2e2e1e3@realtek.com>
References: <20261118134625.801221-1-shxzhaosr@163.com>
In-Reply-To: <20261118134625.801221-1-shxzhaosr@163.com>
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

Shirong Zhao <shxzhaosr@163.com> wrote:
> rtw89_fw_h2c_update_beacon() and rtw89_fw_h2c_update_beacon_be()
> cast the sk_buff pointer itself to struct ieee80211_hdr to compute the
> TIM offset:
>=20
>         hdr =3D (struct ieee80211_hdr *)skb_beacon;
>=20
> The 802.11 header lives in the frame data returned by
> ieee80211_beacon_get_tim(), not at the start of struct sk_buff, so the
> cast reads sk_buff metadata instead of frame_control.
>=20
> For a freshly allocated skb skb->next is NULL, the value read is 0 and
> ieee80211_hdrlen() happens to return the same 24 bytes as a real beacon
> header, which masks the bug.  As soon as the skb is on a list the
> computed header length is garbage and the Group IE offset passed to the
> firmware is wrong.
>=20
> Point hdr at skb_beacon->data instead.

This is key point, so I'd rephrase subject and commit message as:

subject: wifi: rtw89: read the beacon header from the skb data

message:
Point hdr at skb_beacon->data instead of skb_beacon pointer itself, to
get correct header length for TIM offset for firmware.

Fortunately, original (wrong) header fc is 0x0000, so header length is
recognized as 24 bytes, which is almost the same as AP mode application.

>=20
> Found by code inspection; not observed at runtime.

I tested with real hardware.

Tested-by: Ping-Ke Shih <pkshih@realtek.com>

Fixes: 69466b979a72 ("wifi: rtw89: use struct to fill H2C command to downlo=
ad beacon frame")
Fixes: a880b9283009 ("wifi: rtw89: add H2C command to download beacon frame=
 for WiFi 7 chips")

> Signed-off-by: Shirong Zhao <shxzhaosr@163.com>

Acked-by: Ping-Ke Shih <pkshih@realtek.com>



