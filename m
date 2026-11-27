Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795739891;
	b=s2T+137LukpL7INpsUig8IwiEqd6xdkhTtAV4/GO2ybnS3ouCpQ6knj9JU/7A3k+ad2q
	 RptKFVAk29s4SP2pullGtHO7pnZStMD8hCYnahfOQl12ELINg/xJsAYQEI3VGDVSV1VcI
	 5bl6Buet8KkQciiWxwGt1cYGnRvwU6618VJDHZm8t+W3zJoH0GwzHNdX44Lm6L6mEk51m
	 TsFQBA1uAon9twaVOCJ2UtYjLSEnjxNsL06Gubm8kWIDKIaOT9x21gX5rEYtYeKNxW46G
	 tdvHgO4BH0nW68V4Fw2gqFmBuUSBGgnwkyuhnKW8+Hyxv2NC4qIFo0Y8d3WS3owc9yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795739891;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Y1FKW8xIYiIpaEPrmECOjixE7s76tYmG2eWADy2j5wk=;
	b=0xfZy+Fhnzl3USKHCpgvQOWR4KofJvC323+fPjZqUlMdEB6hM1h8sAbDDZLpF1yduomw
	 o6WeZp8P3kmKgDDDlx8e5sJxVZB7fZ82mFcJrGbgf1JJ7oNRydkjBzBOMhe9rHEg4WQrm
	 v3lkTTC/aVn83L7+boDS0XDh41Qy0W5XSf9fZsnITwT30SfGIbdwHkyzUUfDooMxxhtMv
	 tGntX1aINi+mm2h0WvUUUi7Q4AAdEyz75GqCu3rZJAJfbmdGUeqqf+FeBtvTkwKecZg7B
	 eV1G0Cslpw/A7ZWWM4zUyJ0pio72kWSXrSC93QZsUBh2ATB5IEPTN3QD4xo9hHgJxmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=a2Nf7Otc;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D676606A31E;
	Fri, 27 Nov 2026 00:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D676606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=a2Nf7Otc
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AR0ba2Z3515030, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795739856; bh=Y1FKW8xIYiIpaEPrmECOjixE7s76tYmG2eWADy2j5wk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=a2Nf7OtcbtlvLKZEtrkewhGNAp/xBmTVkrUvmqTni0QMohEMQurSpSpIsvFRYsAPu
	 F9utC9PVa1vIH81chtsqEQKQh4mRwMZeY9WFSwrqJeGC247rgR12csCYe5hX8wiwJX
	 BTyGiFPNbF4UPCEPokhR/ILM9gTEwVNpVQEDXn9caiiFdY2eta0LkMCRqgq3h5Gcyx
	 Li66j11tq06qJu5ZLR78As04Ns+l8KQDY7sZnzdd1VlwY0WngZbq429ZOmd4fKnOmZ
	 2XfuUOSG/mb54qtkX1IfM+Gjjt+esR1yxpyC1InXfrc6Gs38J29bqGHKdrUm+g5JzZ
	 Ot1HG1T/X8lSw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AR0ba2Z3515030
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Nov 2026 08:37:36 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 08:37:37 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Fri, 27 Nov 2026 08:37:37 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
CC: Luka Gejak <luka.gejak@linux.dev>, Kalle Valo <kvalo@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v4] wifi: rtw88: 8822c: validate bw and nrx read
 from registers
Thread-Topic: [PATCH rtw-next v4] wifi: rtw88: 8822c: validate bw and nrx read
 from registers
Thread-Index: AQHdfRzleDq60UXOdU+FWOgyWX/QErdBFHPA
Date: Fri, 27 Nov 2026 00:37:36 +0000
Message-ID: <2942bdc6c66949bcb90cbc9ea61dfcaa@realtek.com>
References: <20261125203753.428868-1-zeshanahmednobin@gmail.com>
In-Reply-To: <20261125203753.428868-1-zeshanahmednobin@gmail.com>
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

Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com> wrote:
> rtw8822c_phy_cck_pd_set() reads nrx and bw from the chip with
> rtw_read32_mask() and uses them as indexes into dm_info->cck_pd_lv[][]
> and rtw8822c_cck_pd_reg[][].
>=20
> When the chip stops responding on the PCIe bus, register reads return
> all ones, so bw and nrx both become 3. bw =3D 3 is past the end of both
> arrays.  When the chip stopped responding on Ubuntu's 7.0.0-43 kernel,
> UBSAN reported:
>=20
>   UBSAN: array-index-out-of-bounds in .../rtw88/rtw8822c.c:4407:21
>   index 3 is out of range for type 'u8 [2][4]'
>   Workqueue: phy0 rtw_watch_dog_work [rtw88_core]
>   Call Trace:
>    rtw8822c_phy_cck_pd_set+0x33c/0x510 [rtw88_8822c]
>    rtw_phy_dynamic_mechanism+0x310/0x330 [rtw88_core]
>    rtw_watch_dog_work+0x217/0x330 [rtw88_core]
>=20
> nrx =3D 3 fits in cck_pd_lv[][], but rtw8822c_cck_pd_reg[][] only has
> registers for nrx 0 and 1. The entry for nrx 3 is empty: register 0,
> mask 0. If bw is valid and the level changes, the driver uses that
> empty entry. rtw_read32_mask() then shifts by __ffs(0), which is
> undefined; in a test that faked only nrx 3, UBSAN reported "shift
> exponent 64 is too large".
>=20
> Return early if bw or nrx is out of range, before either is used as
> an index.
>=20
> Fixes: 479c4ee931a6 ("rtw88: add dynamic cck pd mechanism")
> Reported-by: Luka Gejak <luka.gejak@linux.dev>
> Closes: https://lore.kernel.org/linux-wireless/f6a7d3272fe7635c6a83698dfa=
b5d85500437ca6@linux.dev/
> Cc: stable@vger.kernel.org
> Signed-off-by: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>

Acked-by: Ping-Ke Shih <pkshih@realtek.com>



