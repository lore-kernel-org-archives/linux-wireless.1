Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794108534;
	b=CHQyWCvwku7BAYjYuFc4tTnDX/w/HgRFeih0Jw2jFyiwYGmBF6vF3I1GUOvhLQi2Wwa6
	 2QD9NG+vi98lUs7WaHc5+ymn+RmZDT3wlx0EAiqX2EWDG42oxtum2teO4xfHs9mD2fTSe
	 1Bg8BzykWwKFt8VbxXkGXJS1Kxo1v04djUKcOKCLMmKzSg5sakwdrxLgEo0M+oaGYyLK0
	 WtNOMCmoKC0mJczp9Py0DP9vbYWxiZDiDVMgvSrz6EQLJx4SZ0CCcSuO+SB9uzhj9y5pK
	 BfdWyec1bfyssO+B4Cxq/XJLO/KkT6/0CbBWrU+Zj0rsFE0yvKsSrj5PCsUXnvEmAcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794108534;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=6LysHUSjdGg1F/eXUvqHmt7fH7/B1Z3M1UBlOePjA1M=;
	b=3w3XIkmNz2w5E3k1LSD73qJ19CyLL695CTvRKjcKngJ9nuDAgVLpr/A6kYn29t/8Y7K+
	 jSphrZmdQt0M8ohlWeGVZ19G8fD5rHW8WiEjrxS1DaQYyjzGPJqjNm7M9VcJljI4/TuF/
	 KeNvbJkucYYlV+2gK7vDu+gFXdvBma0FWU0/aiZJjKTwi0rf0lpFWCcdw0wvECKZJnmqI
	 KlitfdUHThRlFtUv5PE4FdMBrsjdk/jvFuX1v9g4NAuArDAnCu8TdgWwdDN2NJk6s3Vov
	 fVjgjvbWpGuw/In5I54fHRBf6J8LwjXK+1d+75aCpTVyt2Qlsep019HNuDTOnnhbSEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=KvCzqqEi;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77422606A31A
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 03:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77422606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=KvCzqqEi
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A83SmU823114881, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794108528; bh=6LysHUSjdGg1F/eXUvqHmt7fH7/B1Z3M1UBlOePjA1M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=KvCzqqEiEmuAH5NBasmnmucXmfqete13PXZ1s3m2j82nDUEsrm0+WIW/gHNLhvoVM
	 bUlcnrqVdV4BwUr965/wPUkaAN/U4STWx1va2FAWGvxrmOzRTBikiM/Uwd/OXyxHbO
	 XfvezHBSAO0K+4hvKjnrYk7GulutUL3vRiR9TD7ub49Txma+cCv7GJppFGWnixmXoo
	 GmiUrhb0ymUWGvBhMgx+Q0zNbuaGpPSAmJjoCzMJNcYczk2WjQUYyhOQJ2l9KCHb4n
	 N7EL55iaIFGIActaTU6Zf+4lGL6E0De/4fsN21c2QMLueM5RwpbTh0s462pOfFBfKt
	 UaSuyZATcxorQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A83SmU823114881
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 8 Nov 2026 11:28:48 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 8 Nov 2026 11:28:49 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Sun, 8 Nov 2026 11:28:49 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Frederick Watkins <freddiewatkins6@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH] wifi: rtw89: pci: disable D3cold on Lenovo Ideapad
 LNVNB161216
Thread-Topic: [PATCH] wifi: rtw89: pci: disable D3cold on Lenovo Ideapad
 LNVNB161216
Thread-Index: AQHdbxPuFTVH2CX4SkOw0x07uZnUxbcjg28A
Date: Sun, 8 Nov 2026 03:28:49 +0000
Message-ID: <20694cf6372343ea877a015a695fffbe@realtek.com>
References: <20261107235819.19758-1-freddiewatkins6@gmail.com>
In-Reply-To: <20261107235819.19758-1-freddiewatkins6@gmail.com>
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

Frederick Watkins <freddiewatkins6@gmail.com> wrote:
> The Lenovo Ideapad LNVNB161216 is affected by the same PCIe link loss as
> ASUS ExpertBook models after entering the L2 low power state associated
> with D3cold.
>=20
> Add the affected board number to the quirk table preventing entry into
> D3cold.
>=20
> Closes: https://lore.kernel.org/linux-wireless/auyIxMg3r767ud7z@freddies-=
laptop/

Thanks for the fix before I read your report. :)

> Signed-off-by: Frederick Watkins <freddiewatkins6@gmail.com>

Acked-by: Ping-Ke Shih <pkshih@realtek.com>


