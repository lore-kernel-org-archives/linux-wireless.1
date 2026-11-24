Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795481132;
	b=1oSB8ZhTI6nK0YW+6VWh+upDqtfvZtXYcow9YXH4Nw5+FeYOuKVjzj0SUuA4pzfIG19J
	 ElvFTzRRaVcICSfOWGBi8weA3XuFsDtRdUe4O+Bjh66rVRR17l3lPomq7E6fQYEBqphgg
	 aG2lXtPUEM5Dkw5xGWiCkI+aNqRNBR71G+TRivtusoAxNxUQ5FQ3rWb2+cZKJreuDg588
	 bLuem0HNpP/+6bZO4SQC0G2yfmjVjV/7QNa87b/pYMr1Tgj9sEPpov7QHWWGZtGLE0Onw
	 e37ymZ56a8jYKHMd3ASbUQ+JuKbjmxfBqVIcrv2pqQIwV4Pks1MorMGb7llxCEli6eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795481132;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Visomph6nO1/Qn66GU9Ti+1ZYI7k/N5Zgq6d3OR/SC0=;
	b=ZU/3nLqsNW/RFgB2kjPO36J5Ns/noi+djmhi5z+UsNvBsdfH6SO1QHcpiLPe8NFYD79o
	 +PlhvILxnjGFeL4wslk8fckU6nVqT1HzvaGprW8jdw6xU7uk5ObLwmphcUiNyuqUATTqJ
	 uedFAmnbx+NaGGXCSCGpagNyKYNDAR8fXO08aBeodTh/aFW2J/j7Bko080V7NKBjKPJsc
	 79x/slIPAyPYodahGhS1XvVaFPTpB1C1YDGgf2wm/yr9hkiIl4N+ZqpEQuDLYqEIMtzWa
	 yLQebF003TVq1NVXQ+S51gbFNixnmJ7Jp93n2uWk/oRrc7UWtzkIalECMXMKWOAfNow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b="j20F/LZo";
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFD8606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 00:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EFD8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=j20F/LZo
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AO0jPvO52085835, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795481126; bh=Visomph6nO1/Qn66GU9Ti+1ZYI7k/N5Zgq6d3OR/SC0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=j20F/LZo8syF2KM4Pe2yYa4j4tQsuk8HtZsfTdBf88dcQscqBywp4QTMF8gflDWjX
	 Qvdf6HwWasC+00wAWJ+BA5dRX5g3d+K21A4VnAlmskS4VEQeuWBeE3f+a9iEDhmR/W
	 rdxUv0vnN9LGHq9AtNCZhXJqAnUr4YaBfIRulRQHLpVg0NXfAm6dcg1eBCaHMc+AER
	 WY4OCOEdNil/E+XgSAQPmqi0Eh1SI9V661de6Koqcisnp5BDt/eG2unfqs+eVIHNiB
	 yLcQBczc63ip9INLQYRyWHESP9DRCYItBgtQUFY6X3Pj8fRsHJ0oKgtyi5ibEFbRoe
	 tiWPWm2UTQKcQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AO0jPvO52085835
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Nov 2026 08:45:25 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 08:45:26 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 08:45:26 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 24 Nov 2026 08:45:26 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Josef Schlehofer <pepe.schlehofer@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH rtw-next v2] wifi: rtw89: debug: fix diag_mac crash
Thread-Topic: [PATCH rtw-next v2] wifi: rtw89: debug: fix diag_mac crash
Thread-Index: AQHdezaOyvkj6ke3mkKBZ1W4XLnytrc8Y6iQ
Date: Tue, 24 Nov 2026 00:45:26 +0000
Message-ID: <b7d530a8568147d3840ca920e8839620@realtek.com>
References: <20261123103647.50876-1-pepe.schlehofer@gmail.com>
In-Reply-To: <20261123103647.50876-1-pepe.schlehofer@gmail.com>
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
> Some DIAG_MAC elements start with rules for other HCI types.
> rtw89_mac_diag_iter_all() skips those rules but still updates
> prev_sheet and prev_seq. The first rule matching the device can
> therefore be mistaken for a continuation of the same sequence,
> leaving p_rewind uninitialized. A later sequence transition then
> rewinds the output pointer to an invalid address and can crash the
> kernel.
>=20
> Update prev_sheet and prev_seq only for rules that are processed.
>=20
> A walk over the DIAG_MAC rules in linux-firmware 20261019 showed
> unchanged sequence grouping on PCIe and corrected grouping on USB/SDIO.
>=20
> Tested on RTL8922AU (Cudy BE6500) over USB in AP mode with
> backports 7.2 on Linux 6.18.64 (OpenWrt). Without the fix, the first
> read crashed the kernel. With it, three reads returned 147(41)/86/84
> and traffic kept working.
>=20
> Fixes: 7bf433c6767f ("wifi: rtw89: debug: add parser to diagnose along DI=
AG_MAC fw element")
> Cc: stable@vger.kernel.org
> Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>

Acked-by: Ping-Ke Shih <pkshih@realtek.com>


