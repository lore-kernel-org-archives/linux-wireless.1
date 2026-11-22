Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795318085;
	b=YYO9nRGPbEgjil1+ELb1sCMCMm83/4bB4GmAjIxFrGjnRX2Yibe9sbtoznDZeXX8gIPu
	 y/1YrvNletKmQ0gKJwrViq47nK2HZPTd9622bGDd2gF/sJ42Hbzg6mKNk84fMnOXFQ8+V
	 Udfj+ALEEjlGzr2YoPOe4Vc3DpLllNIH5OqzF+f1qT6g3ucdh9JkaDuVl2+PJK0GLsZfT
	 gjlOZuqbRdMNetsYSDMtINF5MI5Gal3CcNhTmSIFCmNNUPRx8OyMP7CQefOXTaGu1Q5yZ
	 WMdxCTxL0ylRbaAZD8AGF3iqab3uEfR4DNEk7GLSSp69IpQmV1t0NIhuC4XrWUegNdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795318085;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=lhBWHTUPOzw2lAptONgJRqdEhudNx8IaoB5r8NhPwYo=;
	b=VyvyeONqvI72TgHVCwrTF2fdKuF+/fEXV9eY2mkVuo3ei/Al2dDEIY3tBoDVCxI8t1HO
	 0uF+LahsvDunFborQ3kVFandErS1QIeuuBiscxPU6vquLmqdSiNSMLQQT9Tye0U8FY2aK
	 9pI/m3G0Gtzer5kzPoXBFQEZPeH6DC+2WhWEh1hnRtZ0VKrafvEvr/adCT15KjxldCVU4
	 Wad4nHB28JSBgrEUAvd5xwcmV04v5krON/FE+hKtbfEd+Bly2O+lLm0P066jf/dgDjor9
	 IGOvjgweixoXB4C8hjEOnNbR1k19mRjtC9EdqlE/ZwlI1rePxqodQzuKvTNvgcD4A8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b="L/PFXPtv";
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55731606A320;
	Sun, 22 Nov 2026 03:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55731606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=L/PFXPtv
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AM3S0zH4541421, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795318080; bh=lhBWHTUPOzw2lAptONgJRqdEhudNx8IaoB5r8NhPwYo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=L/PFXPtvepRMtU10IlO8Jrzns7r+940HbmILLCt1dFVB7U51q0iRFO2q72qfzTsg+
	 zsBYHnqZjVYbpFgzUqIK7MkzWscDZRe0yVdnjuLUFUDJP8jJIEZ+I+z0yeDh0ikJw7
	 jbwokvc/zCguoRJMHaAo6Ld2hwt6pMMfWztWjMZqB68kESTLQAa9nfBM7wQBM64OmG
	 WoECZRAWc6791dir7mgRSyz2hM43OIf075r7bm9MEbRhJU9/SETeVoZNVligVpKHbO
	 R9PRzCGwl3fKVk4pcmmRB8bA1GAN3B6gFpQB4Rxow5CA2NaM24Hq7cN+9p+GIlhCcI
	 Tp4xYq+ez5/tQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AM3S0zH4541421
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 22 Nov 2026 11:28:00 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 11:28:00 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 11:28:00 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Sun, 22 Nov 2026 11:28:00 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Ho Jie Feng <hjf3108@gmail.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v3 1/5] wifi: rtlwifi: rc: start no BA session
 for QoS null frames
Thread-Topic: [PATCH rtw-next v3 1/5] wifi: rtlwifi: rc: start no BA session
 for QoS null frames
Thread-Index: AQHdeOKzoeDEYzUTwEarjPoSRqZFqLc5b/EA
Date: Sun, 22 Nov 2026 03:28:00 +0000
Message-ID: <1f9ad0fcc61446fb8ce49ef98d5292e8@realtek.com>
References: <20261120113116.153232-1-hjf3108@gmail.com>
 <20261120113116.153232-2-hjf3108@gmail.com>
In-Reply-To: <20261120113116.153232-2-hjf3108@gmail.com>
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


Ho Jie Feng <hjf3108@gmail.com> wrote:
> rtl_tx_status() starts a TX BA session for any QoS null data frames,
> so these polls start a session even though they do not carry data.
> That costs an ADDBA exchange.

Will ieee80211_is_data_qos() be more suitable?

>=20
> Check ieee80211_is_data_present() instead, so only frames that carry
> data start a BA session.


