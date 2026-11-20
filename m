Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134356;
	b=Is/y5tFvNoZQqVXP1/9k6CmQhOwmFOFFuTF3PV3wpS10e7tMF6wfnJA4nzPtfRlHEtUF
	 +xLaONNmEU4cnu5Lp+D1kkEmUwoaZxCPkbeuEYR7GjCCuRqYrQbnUP398d88bbO/1sXvx
	 GXtBpCuOI05vAuUPX3Ds8yR6CC/mlpGXMiWbXsjF50vE2aOTVk8u3/m4H5XCpe6YBHKYu
	 PNW1YysihXvSvz9zvkfStpwPJtDstRDqiqR8MOSBdu7bBvaLIHVwkn2w/9UV+OwjUdU9G
	 1d4zpEebmE1XBugb9JXN51s3782etEM0Djnzhyrz28CR4CgDI8vmY0hCvtmSfWWOV/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134356;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=NsW97/IlB1IOW5S7Wa+ieZcfi4CJA0bmEDqACMcwX3A=;
	b=i8J5o4Yt17yMP0mCMx3Ctp8iCV8XF1Mca4l70zXRx1jZGZTTcpnnaYbiycUU4h7/Dk5S
	 HXSeO4p7yhYiQffhpBU/mbmt29Qzx8MO/ZylbgHP1o9zAN7RE3iNkDlIel4ZAzmgP7DZo
	 uyrO6UYRMNHtVTxVeN0i053Rdy4W9PmEK7KphtvzqD2K6SqtystLdSB8pQt+KZIdu+w36
	 6ZmvXt/QZfWKB6Tfq8WdpJDJYDT9czynEneGmdrJhQcahyxfQyFPHxqgVVI/VXfsArEgd
	 VOlDR6+kg1dE2NKvuXKmP9mhywCKEtTKHutPuMs8hZFILTyFJrv/jh6Gl8/K1q4K5Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b="b/b2fkdM";
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99644606A320;
	Fri, 20 Nov 2026 00:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99644606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=b/b2fkdM
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AK0Po2622984876, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795134350; bh=NsW97/IlB1IOW5S7Wa+ieZcfi4CJA0bmEDqACMcwX3A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=b/b2fkdMgugFugycT1dsFzM0euAvz+Edeq8un0WZ+r/5igqUaCjxqjXIrt2Hil6VM
	 dufGfc5C9BOD955jOoJceyKNzRiLXN/4UVwg65nSjzI4W8NErHUErhxXGIIwtLAQnS
	 kAx6pdS/lPHScEF7KDV3Dx5Ah7O4kUV0bH7orKs4dp635UsV02clZ+RZTiHBZdNh77
	 t4zqISFCOui00ZXzl0Cf6agJBvbZNieezgqp/CVjNtc79R5Z1yWX9UqApRnq2SXH1C
	 aZVTQtfpPE5YQgIVuMNDtwtyu7ZlLHJyzSByyXZQMHrYqHGlFXt/SYbIc+72R24VjA
	 j5xewGklmEpmw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AK0Po2622984876
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 Nov 2026 08:25:50 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 08:25:51 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 08:25:50 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Fri, 20 Nov 2026 08:25:50 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] wifi: rtw89: 8852au: Add support for Mercusys MA72XH
Thread-Topic: [PATCH] wifi: rtw89: 8852au: Add support for Mercusys MA72XH
Thread-Index: AQHdEBhgIKLF4XCqRUOEqFLTRQ13TLZpIRHAgAUzM4CAxrmugIAAnW/QgAA9vICAAQH68A==
Date: Fri, 20 Nov 2026 00:25:50 +0000
Message-ID: <9fef5595013847e8b8a1681846f7adff@realtek.com>
References: <20260710030055.57438-1-abhishektamboli9@gmail.com>
 <9bfdb983981d4bb98a4692ac6f1711f6@realtek.com>
 <8fb9ced500144618b7f43e54c12a25ff@realtek.com> <av5ztQNkWSsLE4NA@embed-PC>
 <9a88c5da71314ce7ad7100d1c3e94a03@realtek.com> <av8rj6mBU8i5vA5A@embed-PC>
In-Reply-To: <av8rj6mBU8i5vA5A@embed-PC>
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

Abhishek Tamboli <abhishektamboli9@gmail.com> wrote:
> On Thu, Nov 19, 2026 at 05:22:09AM +0000, Ping-Ke Shih wrote:
> > Abhishek Tamboli <abhishektamboli9@gmail.com> wrote:
> > > > > >
> > > > > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221738
> >
> > So you think I can merge this patch, right?
> Yes, I think it's fine to merge.

OK. I'll do it soon.=20


