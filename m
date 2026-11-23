Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412601;
	b=hT5/PGir95hqOY7xQfDOwVOtdkLQyG7jtcirBvysYSrWf9Ar5WlLb2+IrLZOdAUg64T8
	 W6pO1K0qcHIlOWPDy10dh7eDhv25gDs4bUIdlseYoZMEZ0E2lVmJtcNKn7n9apLGs/6es
	 TGqLX+1erh27vDmNWbw4o7BFWKoYOaDz3RwkCKBMvRA+M4kubFfxn17twGZoyzcGr4lcV
	 G8PKaIOShMoPyCvwXh2ejURFLuhtmGjYtWUuHUhkvUHJP8LG0Y3gDPYPhGXoplGjL+xcw
	 KhlQFFiZTKlYIYepAS48Z0GFDIi48keCX2jFCJJU7FfGKjr38i7r9fWG/yetVTMvJaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412601;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=8QqD2ZkWa2Ckw9Q/KfYWagFgEGeV3rEDyENDpsstlzI=;
	b=bCnQSN0RFt4smxXe7h0c5j+tFRK4nUh7ihYo6ewm8oT4nZz+Dz+1M0xQSDc8mh92IEMc
	 x52QDplJ8Rwz7/Z3jsSGVLP3q5N7it+woDKl/VeiV+f6sm6IxGAZDDrX1P/IRGbd4M4s8
	 SLrePaXGji7eS01BA3YUSxbnQTqONsJzt4AywThbgFrqfaW8uNoQN4dnh/oVEhgnekbY4
	 9CS3Ez/Nhxzv2o1qwZDL3skTXlbke1kvmv4z2YhtJywsX5FSTLUZiHCf2CjgB5h/6S3Jk
	 qdMpKXTaJqLd/fKrt0l4p/kTRZ14FrSFWyXIfNT9+SzP2V3jBALoVVtuA26gj6RsQ7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=vR2CtwAx;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF67D606A31A;
	Mon, 23 Nov 2026 05:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF67D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=vR2CtwAx
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AN5hGq851393688, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795412596; bh=8QqD2ZkWa2Ckw9Q/KfYWagFgEGeV3rEDyENDpsstlzI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=vR2CtwAxHFfqb8ehKXnb2vT5uDJJqN7DxqfjdmShZ10SyMUs1j0zuZYQj98A7b6dJ
	 4qqqBq/bHVc/QpY0HENgDrdlxkzm85NAA/hPqqWHfKjbnXBu97nY6qWeHcKjk5rubi
	 gXiWjApn9VOfhaAts0JvNTxwxT6+d7HW9wvUdG9ongq5CnOQfpDbwCBStT0OGavYq6
	 tMAJPTqVXDWpHQJYTsklmclY8xPo+Y8j0jxjQhsBXxFWGl17lDnrbVD5RMRvaqGaa3
	 ZvcpXWPg9OGPGDNRBXJBfkwEj7I+x74NX44fjpX2IYuSSsx9NZyjx7efZlOBVWaEb5
	 e+cQj8G2HHj4g==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AN5hGq851393688
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Nov 2026 13:43:16 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 13:43:16 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 23 Nov 2026 13:43:16 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Zhao Li <enderaoelyther@gmail.com>
CC: Hemanth Selam <hemanth.selam@gmail.com>, Morning Star
	<alexbestoso@gmail.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next 0/3] wifi: rtlwifi: don't mark unencrypted frames
 as decrypted
Thread-Topic: [PATCH rtw-next 0/3] wifi: rtlwifi: don't mark unencrypted
 frames as decrypted
Thread-Index: AQHdedZu2JzQKMh4KkC+whaoNAXXp7c7JGHQ
Date: Mon, 23 Nov 2026 05:43:16 +0000
Message-ID: <9125d3868f9e463f8639f3449cc7db2e@realtek.com>
References: <20261121163547.37019-1-enderaoelyther@gmail.com>
In-Reply-To: <20261121163547.37019-1-enderaoelyther@gmail.com>
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

Zhao Li <enderaoelyther@gmail.com> wrote:
> rtl8192d (rtl8192de/rtl8192du) is intentionally left untouched here:
> it checks the cipher reported in the RX descriptor, so unencrypted
> frames are not marked as decrypted. However, when a cipher is reported
> and SWDEC is clear, it still sets RX_FLAG_DECRYPTED for protected
> robust management frames. Ping-Ke, does RTL8192D decrypt those in
> hardware (or set SWDEC / report no cipher for them), or does it need a
> robust management frame exclusion too?

Per rtl92d_rx_query_desc()

	stats->decrypted =3D !get_rx_desc_swdec(pdesc) &&
			   get_rx_desc_enc_type(pdesc) !=3D RX_DESC_ENC_NONE;
	if (stats->decrypted)
		rx_status->flag |=3D RX_FLAG_DECRYPTED;

I remember this chip doesn't support PMF. For PMF packets, sw desc should b=
e 0,=20
and enc type should be NONE. So original logic should handle this properly.

=20
