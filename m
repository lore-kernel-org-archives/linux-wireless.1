Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795073316;
	b=PdSpTDIj5MydOg0jn2XzS4uwLMpKfTTxWYnsl5pTBT5wxx7uqwxuBk07WaQn9wQKUtMQ
	 8dC08LzryBwwyUenCHG8+zEddyMu/OYc12U9so1LMx8n6Nwnkz85a4sdjGLwi6XoYyB4j
	 nLtYJrsKeDiWEqdfGajWitMMCNGNXKWuGPBSt1RC5zIn7QSRQbr3cqIaa0mR75StSv+G7
	 vjeTW1HqDvpL/IJMspvFljFaTvRI+QfG/fSeJJJqIvb/TmpLVjQhtIIZae7u8+poE+mjx
	 Klq6M75SkSBNSt6J5ZKGeS2W7ife7DzJzupnZIeXIexzCSbS+y1pBcMyUASWv5Iktsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073316;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=3ihR7eCB4G6wv/0nFpiRegUwIVondv4DzhZ5FLktMLw=;
	b=2PpsCouwloeuO38PTY7MvZIuMGSj028aqIJF15cgyTbhTXO1m1o7NoesGKTuZ8zIDBoQ
	 f9vHkWGfLexIji9QZoocOB+VbGzOhCQJQjv/+xtF6djhfQ92mjxY39r7RX+IIE725iGQD
	 3TvxJGI6BWG+p1KXI50LnkpqMG9jp2U+mlAkx/HJTI00QVAVpJaI0Ivhe1OPUNBpyghv0
	 3gyrjBUNJkTI3G+f0Y6cFcjMCTyZkT197yg4YkR/3vpLvkFjtxVIr8698AIGH4OsLIVN7
	 4DZisX5jJ1o57HJN3Z4u4qR6vmlU/8XAqPpOCaub9eJjsJcRxvKO8gsgkqpJ47hnh1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Jy4EHcbF;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC4C606A320;
	Thu, 19 Nov 2026 07:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFC4C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Jy4EHcbF
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AJ7STKb82107709, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795073309; bh=3ihR7eCB4G6wv/0nFpiRegUwIVondv4DzhZ5FLktMLw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Jy4EHcbFrU7px7zAQTqDG92qiO7rRmI67qXgJLVVeTuwxCILczRPiSYB5AzQTq29r
	 tdznLHrhhw3uqpCUsN7VLRKWMaRSc33TQ0e/MeipjORaSKYR8Kd27Aj9AXU6DuvwX6
	 XIQ1M0joBOr5SdDJbQii9I9udHsKkuLjpARCtEhyme0sfK/fnqdGdFuP/CB+vMpb28
	 0TFwy7G5tvMGRTJlSm7KQ2NHl0pFH203hs8z5KYf3UjQKULvl9HDcvRMr8x7fLFbqv
	 BMc4G51wDyHB2bWAzB4gMwQzH3wY5iVYLxCtrAy6x7qkDzpBh/+PgHJalv4JuvcKia
	 J9Mde6+TKwfug==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AJ7STKb82107709
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Nov 2026 15:28:29 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 15:28:30 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 15:27:54 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Thu, 19 Nov 2026 15:27:54 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Enver Ikromov <owner@ph4ntom-rev.uz>
CC: Zong-Zhe Yang <kevin_yang@realtek.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v7 5/5] wifi: rtw89: honor ASSIGN_SEQ, retries,
 and NO_ACK for injected frames
Thread-Topic: [PATCH rtw-next v7 5/5] wifi: rtw89: honor ASSIGN_SEQ, retries,
 and NO_ACK for injected frames
Thread-Index: AQHdd4fZfr7IjO0wuUOscyaR3MEZu7c0/PUQ
Date: Thu, 19 Nov 2026 07:27:53 +0000
Message-ID: <10ecdda16085441c9eb930bc88c79c6b@realtek.com>
References: <20261118180435.904-1-owner@ph4ntom-rev.uz>
 <20261118180435.904-6-owner@ph4ntom-rev.uz>
In-Reply-To: <20261118180435.904-6-owner@ph4ntom-rev.uz>
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
> Injected management frames currently overwrite caller-supplied sequence
> numbers because hardware sequence numbering remains enabled when
> IEEE80211_TX_CTL_ASSIGN_SEQ is unset, and injected frames ignore NO_ACK
> and explicit radiotap retry limits.
>=20
> Preserve the caller's sequence number when IEEE80211_TX_CTL_ASSIGN_SEQ
> is not set, apply NO_ACK in TX descriptors and completion status, and
> honor radiotap retry counts up to RTW89_TX_DATA_CNT_LMT_MAX (63).

Since RTL8852AE doesn't have NO_ACK in TX descriptor, so please note this
in commit message.=20

> @@ -1800,7 +1814,9 @@ static __le32 rtw89_build_txwd_body5_v2(struct rtw8=
9_tx_desc_info *desc_info)
>=20
>  static __le32 rtw89_build_txwd_body6_v2(struct rtw89_tx_desc_info *desc_=
info)
>  {
> -       u32 dword =3D FIELD_PREP(BE_TXD_BODY6_UPD_WLAN_HDR, desc_info->up=
d_wlan_hdr);
> +       u32 dword =3D FIELD_PREP(BE_TXD_BODY6_NO_ACK, desc_info->no_ack) =
|
> +                   FIELD_PREP(BE_TXD_BODY6_UPD_WLAN_HDR,
> +                              desc_info->upd_wlan_hdr);

Just straighten as original (a little over 80 characters).=20



