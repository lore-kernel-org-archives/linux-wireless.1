Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795066842;
	b=BM/u/GF0jtACSzFxvggbHsUFl8Ilqgxw+xJsBcJoqx1SMp5kWCvmkA54JmZWxHOy/Ssf
	 2YNsNzfSB5EpcHS5ebLjeIAoLPjphlIe11123+zDrSD1NmLng2habXIYttfxJ6K532X0V
	 iWBUuJ5aKNlV7x9JiKsXN2srT+Ni3O+I64GGfBxqq0ju4yDZRL4BMwpNIyUQmexSuOKu+
	 38nVvyrEV9gNeulRoguEc5YdrPGBhhfXOqvUXDoS1rsjUAJFV1+aAmayAjtJRgO8LVvyg
	 tsK8gLd5mhKMj6H6j85NwIhf8STNYfbEW1ZQ3RJXec7Flv6019Fq+12CE1/L0K9NwmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795066842;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=40gCwlhBQ2vMzJhrxFqI4nChdAcygUfLYF1jlLF3y0g=;
	b=ju+r1Vul3zA9Jgcq8yWdBhIKod81HfRtjkS9C/RusDnwTsrMjnHV8lxq1e+V5E+dZlXy
	 WZ10AC51w2S5wNeuZKsg6r82KV5HQSlNObHD1krU/KTpdmwX28aj3PgpPD9uwboyh9qYn
	 95o1tV7mpv7t+UyHpUWSLTVPtxJQmstW2AOYZAheCyYAaAtBiW45P55aOamRPgKNbVGUq
	 jaT+W0AxMpRt2ctwMmspltMDAm/cC+Pt2O/ZtfOtosWhwXUV+8BJFdYWmFm/QBP9R5I1w
	 NKQoNdiys2oVgwzhfyEmjlhjMK/Md/gYj/eK4RrlDJHRdKlXuzn9QKScqhH5zoJK6jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=FYXq9Rek;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1456A606A320;
	Thu, 19 Nov 2026 05:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1456A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=FYXq9Rek
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AJ5eOiR52043728, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795066824; bh=40gCwlhBQ2vMzJhrxFqI4nChdAcygUfLYF1jlLF3y0g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=FYXq9RekHvXLmwdmMO2Q9FjfkAFfjL3l0SZmJ2hjUmEG0CZIJzv8SAPmckSjhQ+pm
	 EmggpeaJyrfWgSyMHVXkye37/FlwwLvxWBVl0N5O0T9dYqcpQpJh2dLQABavfTq1R+
	 lUk5G7M4QW/IpvUZCW9ZOXJtl7o7TL1evA41IJoZDUWwZFpBJHlyYU9sOvf/fJ+nwh
	 heHPpQSiYIar4cSMalVexfXs9lwAYQSLcvYtle3ImZx0Rq2XVQUQx7Mh8ZSYOzhhRg
	 K6QfU/6kYjTBuFxAHYx6KPDBAamBeYAAE2xXadHcNiF8Mc7K+05ErTjOej5Or1oFkr
	 pEx8MxzaWmbqA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AJ5eOiR52043728
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Nov 2026 13:40:24 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 13:40:24 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 13:40:24 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Thu, 19 Nov 2026 13:40:24 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Shirong Zhao <shxzhaosr@163.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] wifi: rtw89: read the beacon header from the skb data
Thread-Topic: [PATCH v2] wifi: rtw89: read the beacon header from the skb data
Thread-Index: AQHdd+Zc+tJkrMhtfUCd+D8KR4zqjbc03pkA
Date: Thu, 19 Nov 2026 05:40:24 +0000
Message-ID: <56b22f76b86847d0a2cad93f27ec86c0@realtek.com>
References: <20261118134625.801221-1-shxzhaosr@163.com>
 <18e2bb0a73414b528db9741eb2e2e1e3@realtek.com>
 <20261119130618.455918-1-shxzhaosr@163.com>
In-Reply-To: <20261119130618.455918-1-shxzhaosr@163.com>
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
> (v2: reworded subject and commit message, added the two
> Fixes: tags and Ping-Ke's Tested-by/Acked-by)

This should be put after your s-o-b with --- delimiter.=20

I forgot to say that I will rephrase the commit message when committing.=20

>=20
> Point hdr at skb_beacon->data instead of the sk_buff pointer itself,
> to get the correct header length for the TIM offset passed to firmware.
>=20
> rtw89_fw_h2c_update_beacon() and rtw89_fw_h2c_update_beacon_be() cast
> the sk_buff itself to struct ieee80211_hdr:
>=20
>         hdr =3D (struct ieee80211_hdr *)skb_beacon;
>=20
> The 802.11 header lives in the frame data returned by
> ieee80211_beacon_get_tim(), not at the start of struct sk_buff, so that
> cast reads sk_buff metadata instead of frame_control.

No need too much description which obscures the focus.=20

>=20
> Fortunately the original (wrong) header fc is 0x0000, so the header
> length is recognized as 24 bytes, which is almost the same as the AP
> mode application. =20


> The value is still wrong in principle and would
> break as soon as the sk_buff layout supplies a non-zero value there.

Yes. But "fortunately" it is zero for this case.

>=20
> Fixes: 69466b979a72 ("wifi: rtw89: use struct to fill H2C command to down=
load beacon frame")
> Fixes: a880b9283009 ("wifi: rtw89: add H2C command to download beacon fra=
me for WiFi 7 chips")
> Found by code inspection; not observed at runtime.

This is not standard tag. Should not here.

> Tested-by: Ping-Ke Shih <pkshih@realtek.com>
> Signed-off-by: Shirong Zhao <shxzhaosr@163.com>
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>

Anyway, I'll take v1 and modify commit message while committing.=20

