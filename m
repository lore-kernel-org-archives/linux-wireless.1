Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072634;
	b=OdJmRVAzZkZpvULNW+GEE9kNHNbAaXOISZz6vc4PEGRX1ZoQPcaKrV7KYAFgyjJcqt1D
	 yi0CYV+tVJyU+5++hioubcNpD5K/mrvPxhsEgN+8Hli6kTQsurXyeiLpGDRoY9szS31QJ
	 bF4Bo93UeArUyWqa2EqlVwfBePY/eNCH0bdD5WHUMf7zPIQK9IJTMb99UW0fOpWsg/r5P
	 oM6WmNk3N5Z3QE/waatRAJPF/Xf4eBCY+1CDzc1cjbL3yL8bg/dAyr5+r9eAAVQjQwrtG
	 heuNivBl6NQWR0fDN/A44nlwv32Nny8zn1RY+nl+aOn/ajWRZpMrStxr9t+mwZtb+2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072634;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=fItARqE1H9/XE7qHQ0ovwsXzV99q3oVbHe5BMQkRb3A=;
	b=URQA0nb9xFUNh+dcZ9WLm3DflUlNqRccf6dZBanXaSUohC27O1o3zyKe4Pf2wbd/J21x
	 LtEhdkZGyrEV4DVS6GBrkRnAG/o3SsWPaozIkX5UuZBxi+3VMj079Osjsm6diMl9zknF1
	 4LlMxaOwtGWNMzkydT2yElhpbE91uWEADyp3S+WhmrzJMlwa7YYmSJfkQ37EG2H45x7Yd
	 Xhq8DENV1yyZ9E7ARBh41GqaZT9W2tQxOmo5L7SCH+jEWOfC/7ncDg8lzA2w4EWCe58Ui
	 9MKX2Rf8xZveftm4zHylLKZGzb7GjzkuftJuZG6SkvveoKbIOTj+KQ92Vj6qu1qajWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=kE1b2nZq;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F831606A32C;
	Thu, 19 Nov 2026 07:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F831606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=kE1b2nZq
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AJ7H8m542102791, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795072628; bh=fItARqE1H9/XE7qHQ0ovwsXzV99q3oVbHe5BMQkRb3A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=kE1b2nZqeSxFc5hIUIkFsJ3T5EE9H3GLTyOD6JrA/VoDWYDLpeyLWHtFvFF6lP09i
	 gWCw1pSCIoMKMD2KoimJW7udC1Lab7xcEOGMuUsBia66Ht0//98JU7blt0KLm4RAe6
	 pP/A5fCvt9q3K5WRHHNsDJNgVliAa69oOOp+vSFvEdGQLfCnp/K5MjjAJvJdMVmUIK
	 VkLF93252ulAg+pN14a6K9SWFatphN7GVUtZtfdRkDg+lhkEDz5mBd4WbZlTMqR4J9
	 Ij0/YEtZXfUpUWGJUPA/GP1Iwh1z2f1Cmri627o6DnBFSZ51DsQU5l7C5JLokIJqj0
	 0+VTSnGGJJ0IQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AJ7H8m542102791
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Nov 2026 15:17:08 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 15:17:08 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 15:17:08 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Thu, 19 Nov 2026 15:17:08 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Enver Ikromov <owner@ph4ntom-rev.uz>
CC: Zong-Zhe Yang <kevin_yang@realtek.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v7 4/5] wifi: rtw89: avoid reading seq_ctrl on
 control frames
Thread-Topic: [PATCH rtw-next v7 4/5] wifi: rtw89: avoid reading seq_ctrl on
 control frames
Thread-Index: AQHdd4fEzD3UxuxQ+kyNsCQjLiwnnrc0/NNA
Date: Thu, 19 Nov 2026 07:17:08 +0000
Message-ID: <95cffcf6025a40b3aa5ae5e14879cb27@realtek.com>
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

Acked-by: Ping-Ke Shih <pkshih@realtek.com>


