Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072293;
	b=ON5NZ0ogb0Rt7fbVODvjDJy5U/ZuN3AiTPynzjL16yPcpIz/0gW/lqU9OHPauwSOhtj/
	 x/rb6ZM4qG5/2fpjd9wLA47amoHT/35hZXnKqQ/NCwlJiYBdh3mKOsyTxhTM2+0EloVl/
	 2Tw3R+zTXx0XR8fgbWxnEV5XPjQr0sqGYfwfRgbdqF2ASLOFQNbiT+Xv1bbmiM4ncH8oL
	 2Q+7X7FHqH4xnqdjBOS8lcw3PoRtFaXV6DwoTCt2NeBorK5vu0PRP/7jsTPgxTnVNjPQP
	 D5dIqErByFZYTxaH0ZkeRisXrH6EQK65gUyCugLpbtP1+M40GqIh84k4CQngzg0AP/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072293;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=3H27PZYeg0F7WD3xYIAvlo+YW6wz0EYjHTCWT6JoaN8=;
	b=jzAVPIxji6vZUmWtct+CawNeI6VvPXzi51y9quXjgSeGqFXrKzOCTBCY0aVd1qhrueiw
	 usJYhQrkC5d2SrEQ97nsybW46b8eO3cPW8kVWwYb0QXHdVRX+JlygXlqqWO+WAEmyjdG9
	 fr5xzYXzoFELjjBwotHM4jEvKXlgzUEf5i2FVkRZcsPBdFYEv8fqgjzrm2Pm7p7y3TPhB
	 yKz7gOHiEq1Lu3u5QRX9E4gO4YWdgq35OSc8uvfv1TWhIcTxGUxJzUazLijoq522yOxkY
	 ngGmOJ1kp+d1azWfDadJp5TLs/PGN0W8VJ1YMguXQb7MHXRIF8sRaoYHAPdTqKJw91w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=UTno1jf+;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8765A606A320;
	Thu, 19 Nov 2026 07:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8765A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=UTno1jf+
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AJ7BQ6002100532, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795072286; bh=3H27PZYeg0F7WD3xYIAvlo+YW6wz0EYjHTCWT6JoaN8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=UTno1jf+p5Yql5WmlW0bURKRP26Rak2C/nGfA7kAmgW5NW9BnCaMQBOEDaM5Hk7cu
	 4/yZ+29Z7s2b0ypoxivOtmQ/F2WsOnO7hXF5IszIg2eCEJ5uBuWs7hpxmKGjH58os3
	 dwirIHJ2KNIS+SN0zlb7/EZ0zzzcCfTQU4PMyy2iP/TWcWBHmzvFCHX0OuDd56SZgb
	 J/zQ28LcWJP42kuZrkDZBDqqAgKYkw8kXbytJZSO89EOyMgClnvXsJN4Mnk/8XbOiU
	 uXszWUM/qzQieI4zZtauGSdr4NngSXkxV2+2vFrObAhtgj2IP4Lr48vd8ARnjFd/DL
	 MxgFWr9HUaTOA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AJ7BQ6002100532
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Nov 2026 15:11:26 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 15:11:26 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Thu, 19 Nov 2026 15:11:26 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Enver Ikromov <owner@ph4ntom-rev.uz>
CC: Zong-Zhe Yang <kevin_yang@realtek.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v7 2/5] wifi: rtw89: handle negative rate index
 for injected frames
Thread-Topic: [PATCH rtw-next v7 2/5] wifi: rtw89: handle negative rate index
 for injected frames
Thread-Index: AQHdd4eZqKG2aC17UEaPi5FoV7qsQrc0+zig
Date: Thu, 19 Nov 2026 07:11:26 +0000
Message-ID: <6d92445c995a42bf938b71c761a71064@realtek.com>
References: <20261118180435.904-1-owner@ph4ntom-rev.uz>
 <20261118180435.904-3-owner@ph4ntom-rev.uz>
In-Reply-To: <20261118180435.904-3-owner@ph4ntom-rev.uz>
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
> When user space injects a frame with a radiotap rate that is not
> supported on the current band (for example 1 Mbps CCK on 5 GHz),
> mac80211 sets the rate index to -1. Storing that index in an unsigned
> byte turns it into 0xff and programs an invalid hardware rate into the
> TX descriptor.
>=20
> Clamp negative rate indices to 0 so the lowest valid band rate (1 Mbps
> on 2.4 GHz, 6 Mbps on 5/6 GHz) is selected.
>=20
> Fixes: e96abe4fd7cd ("wifi: rtw89: consider data rate/bandwidth/GI for in=
jected packets")
> Cc: stable@vger.kernel.org
> Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>

Acked-by: Ping-Ke Shih <pkshih@realtek.com>


