Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075791;
	b=3kOXKe38FwLTe+b2deylMI6WtvAjAPqOT2mDeSDo74mFsgcmIw1B3vJYS5EsJnbgV9x/
	 zPkDQIDgcrN5NOi1KEfOMw5nsPnhlYiT+O+fvxvIs5Dw80DoZB46zuGTUCYtFYdH68U37
	 QBc6XbQOICf9tIhrT0vn8PqbfDFok03DXRFpwdyEEmD3nrT5e6UzyN+IgqeE8pk9vzhjL
	 PIugkrZl3sPvalYFT9YRDf+Axj3zVGQZF3Iz0cXZNEQxfHTrTFKG8v2kTobB4xqMz1aD5
	 KKwOn6DbPfFvqcJLkO24ismDQaNC6+MST0M+TbzT/OXf1lJMnoevdAtpxsXahiHcKtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075791;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=1lifaRUTgvYA/L7HW3DEmoIYNjj9LlOEqcnCToJdyQs=;
	b=QKrugB2jBZyKF6FcTZHFvcCn3+N+0MOpLhFqibdpxBkeo9Am8qEPZMjChOqh3rJqUV5R
	 qKIOzifJfr0Ax219/cMqhjl5W/s+4NakMOYZ0K/TH44/W4VNUSxU5H+yQm5F6OGfwLbDb
	 O7LU9D8V2MIkaIkOfk2qn1OfHO+XXPJO6Y/CWk2N/e7JytgdalongCYgRZ8QDKjgIl9CE
	 JCRkIo8arTrEOoetx3aBDwcsoPTUlvZtNN4x49Pt37e/sHk4BldVS4kvRrWWC2+qf0q9F
	 e/y67CWlKcZ4yomH3udKzsCP6j7DwRkx7akET7oM+RQgj+oeqv4heHVGbGo3nKr+tDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=qB9GNVhM;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD15E606A320;
	Thu, 19 Nov 2026 08:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD15E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=qB9GNVhM
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AJ89iFZ22146581, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795075784; bh=1lifaRUTgvYA/L7HW3DEmoIYNjj9LlOEqcnCToJdyQs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=qB9GNVhMgUb6purUcaMuAWnhFTqZkQSmf8iVHskw6TnLr/GbKjnhlczfu/vX9FhMA
	 PQUxXhvxCGsYTpavexXSPWhF3Q7p97OOeXJTyRr0nUHPGnHRxc2aiGBc6eldXPG2vq
	 1uxhARCY6uRIpdWV4ZMqYenOOS5Lf7iTdBTm92DMt8Pg0hUtzvmsn2uAYsrgRzeR//
	 Ruwlukui5jCGvHI5otwSZ0fypdyEDPpgP9LnRwGcH9i+bWlpwMHAJGmLq+h+4JRpmR
	 znFeuh4T2b3Pr7b6HHddkbbUFnTSLFvkDqSEFIfC4K8LLgw+C8F5ATZG9KNJ6CHV+8
	 vpbR/I5/UuE4A==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AJ89iFZ22146581
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Nov 2026 16:09:44 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 16:09:44 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 16:09:44 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Thu, 19 Nov 2026 16:09:44 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Enver Ikromov <owner@ph4ntom-rev.uz>, Zong-Zhe Yang
	<kevin_yang@realtek.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v8 5/5] wifi: rtw89: honor ASSIGN_SEQ, retries,
 and NO_ACK for injected frames
Thread-Topic: [PATCH rtw-next v8 5/5] wifi: rtw89: honor ASSIGN_SEQ, retries,
 and NO_ACK for injected frames
Thread-Index: AQHdd/z4z11fNnC4cEClUdX+6qNV+rc1Cjug
Date: Thu, 19 Nov 2026 08:09:44 +0000
Message-ID: <077a0d609e3c4cebabe6b1be5aa9eb09@realtek.com>
References: <20261119080328.391-1-owner@ph4ntom-rev.uz>
 <20261119080328.391-6-owner@ph4ntom-rev.uz>
In-Reply-To: <20261119080328.391-6-owner@ph4ntom-rev.uz>
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
> is not set, honor radiotap retry counts up to RTW89_TX_DATA_CNT_LMT_MAX
> (63), and report IEEE80211_TX_STAT_NOACK_TRANSMITTED for NO_ACK frames.

> Set BE_TXD_BODY6_NO_ACK on Wi-Fi 7 chips that carry NO_ACK in the TX
> descriptor;=20

I'd add "(not tested)" here.=20

No need v9 because of this.

> Wi-Fi 6 chips such as RTL8852AE do not have a TX descriptor
> NO_ACK field and only limit transmission to a single attempt via
> tx_cnt_lmt =3D 1.
>=20
> Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>

Acked-by: Ping-Ke Shih <pkshih@realtek.com>




