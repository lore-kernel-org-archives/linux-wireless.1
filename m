Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511624;
	b=qwGXXi3O2U/RliX4NXa8AZ9U/Z/yt1JKAwff3lASBHbUK7DvCgz/cWAYLJYxyjDQ+PgX
	 609VBWLK0aY1DW1hx96yuNt14xxnDTu/Y2Wu8sKPRu6qi7d+Vw2UfyetmD/JKwJkTu8Uz
	 VZ9qAOggQbVFwNcPbHQsKX2UsyGgKVi2kIun6jN0lTw1yis2sabBwwJo/WQPLO588JAd6
	 1ujNwvIfqxVDy+sv1kcr1mgZXlFa9l1osHqXUlBSUJvpkEvzPTcgdGlS/CnDtHCGExd6D
	 ICIGcslmnPzCH/iHQdlMGJHL7UaSN/KZ4IvTOlUjVBRYiP5yC6w5XVP+l/cuFsKh2PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511624;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=nj/9Y/Mpn31yNMzqkJXwpAMCnyoh2R1rAGpTEamqNfM=;
	b=1E0u57zdnirftDMvAaqwaquDOaFsUjamKOdoq6hHH7r4TP2WhClXQasgU2oAqcGUp6wC
	 RG5xF1D20lOU0TclqT/UxvCW2C8c9OqqZYV8EEUfRnD0AdgitzQAK5FS46PvaX/h9sXAG
	 0tm5/sWOn0IggVJXIuFso593WRYsSN+zhE0rn46mPGxpPtf9anGr3ZQbJq/SILrqFKvYI
	 HWq++s/bfAd8DVQIC4hE1yyWwEYwrKMeOfMI3fmbZyrZ2w2By1IvOpFI1GR5iJ+JRpPaS
	 ILbjzJPSU8onQWB5r8HCrEnrAQERhWCj/jXLHAIrULqO7gqSBNWhBdpGiR4+kzlr2gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=jLewWH+t;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6EB606A31E;
	Tue, 24 Nov 2026 09:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF6EB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=jLewWH+t
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AO9DTGz82402205, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795511609; bh=nj/9Y/Mpn31yNMzqkJXwpAMCnyoh2R1rAGpTEamqNfM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=jLewWH+t4rj+P8JtpJCNHCnnvIfq9QFnRIMINNzEZzJqvfdYkPKx4SuPmwj3sBy/N
	 rOd7dC924MrTZLygi7ApMJvAd3HCnAFXaYq4rmCA4vHkQh5DD2wxfFFThgK3KMgG5o
	 rh8iWZwWz856MN8EEro1ss5Ki8E4LnK7tW47EZeSTxgDD9XcL4XFyCYcs5cvzBEc0H
	 kt0gZoI9rKidfO0VFWwxV4uP4fjF9ioVf6DbJJYt8ctJE70fZn2m6daTHV3SfpoCqi
	 9eYdvQyhPtLis/Mj22ZP5/TpVRQVN38dImztymlJ5YrZfAWKIZNPQ0NLIWQOH4hXgg
	 yHe6S45bnZ1+A==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AO9DTGz82402205
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Nov 2026 17:13:29 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 17:13:29 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 17:13:29 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 24 Nov 2026 17:13:29 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Mehmet Fide <mehmet.fide@gmail.com>, Luka Gejak <luka.gejak@linux.dev>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mehmet.fide@screeningeagle.com" <mehmet.fide@screeningeagle.com>
Subject: RE: [PATCH rtw-next v14 2/3] wifi: rtw88: support channel switch in
 AP mode
Thread-Topic: [PATCH rtw-next v14 2/3] wifi: rtw88: support channel switch in
 AP mode
Thread-Index: AQHdee+p8j6aIxstNkarBQ/O0oJacrc72mMAgACICQCAAJDwkA==
Date: Tue, 24 Nov 2026 09:13:29 +0000
Message-ID: <243260ca062b40ba965eece69e5c52f7@realtek.com>
References: <20261124002437.213112-1-luka.gejak@linux.dev>
 <20261124083130.206249-1-mehmet.fide@gmail.com>
In-Reply-To: <20261124083130.206249-1-mehmet.fide@gmail.com>
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

Mehmet Fide <mehmet.fide@gmail.com> wrote:
> If Ping-Ke wants, a separate patch can
> cover all callers.
> If Ping-Ke wants, a check in
> pre_channel_switch() can be a separate patch.

You can decide if they are necessary. As I mention in another patch in
the same patchset. If you think that is rare case, just reply your
opinion, and let it go.=20

Ping-Ke

