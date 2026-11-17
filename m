Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904089;
	b=ueViGV5pbECBltBZoD9oVDFL5HBuLBJiGTqD7TC0tsi2QJHt3UYEgiLqi1p+pThIUPZl
	 Zzhq+HeGM0qgt1i8pRiVs3lbNHheZUMtJaSnFpN6x33I79AhIRWhUybZjufmY5T3Fy6Lr
	 rD9lERQE/Aw9TbMKSh8f/LI8ICj/lc5+xv1XbLxg5S/5z7QAFVKMabEGnpJ/78b21V/uF
	 O1tS/mhV+DIb0qJitp3eim38k7XwYpuITzjL/lMQ/x2qSoeEr6AZWbg3L0MdiC4Nnjsf0
	 Nie+3QnEv7ErMVQlQtzbs3jnFeYEC6sTd43YlprTt+idONHH1/65DiBzQDPyhdBrymQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904089;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:In-Reply-To:References:
	 Message-ID:Date:MIME-Version:Content-Type;
	bh=lfmEDuH+vuU8hq7oTwAoWe8C9yQbsXRY2McNeZkjrdk=;
	b=rr9HwEpupzYtii4Lt9O6VsAFjyj3psLLZs2e2lONgjWneW6QRYD3dC4+LwLuqU3BA4pA
	 sO7Xe44Lz/QvdiEWY8OdmWekV5vP5Ajry0SfqkvnP8jhyXWWkV3Q2Jjqgtk0AXFOkchPe
	 O1SRlEghmuL8qrIa82DeeArfb3Vu39QeUpOapN0ArlcqSq7b4JbG/20FKVbXf+gGdK3YQ
	 bP9jlvpsQlXTP+gHuZQiAxUdJ5rkUo3XXxn4a0KmXcN3XWhRgie7WreCMKT8R6/5owowd
	 j11Q5p+yYE/PsSXItf01mHajjlw9RiKL9v/Ud74OaHGntComggcErGMtKGF8EAmfrWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=a1iNGG4h;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFF7606A323
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 08:28:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEFF7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=a1iNGG4h
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AH8S2Bv8087340, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794904082; bh=lfmEDuH+vuU8hq7oTwAoWe8C9yQbsXRY2McNeZkjrdk=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	b=a1iNGG4hWrNlRie1HT6oHzYY5oLRa/RV2J5U2KpnMIwBFVdcAF4zfYDuZ5fzmHvt8
	 bdThepRVKEKRnQn3xkSRotgVWGO2GtzS1uJo0qcebMno32s9Y8f38y54o3gjCyPJki
	 B+q6lxnvy81yT6ryJQ9KsNUDeT7x6mCXziNdPoQ00muW6NuQXOfwiCHvr+t0IU3DaQ
	 M6sPehCh6T1LDf5ZYpZYDbjo4xS+8VZgxDoUTgUamZWxsTUWPuVsVVHkBsj43F7iXX
	 bCyC4/9T2QBlc3khRyGxH3E5kNfMewyAotV/OuVM23g3dDa3tNQP/fhy0yYa2pRogc
	 gZXaqQoAbql9g==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AH8S2Bv8087340
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 16:28:02 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 16:28:01 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 16:28:01 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Tue, 17 Nov 2026 16:28:01 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Rosen Penev <rosenp@gmail.com>, <linux-wireless@vger.kernel.org>
CC: Ping-Ke Shih <pkshih@realtek.com>
Subject: Re: [PATCH rtw-next v4] wifi: rtw89: acpi: skip _DSM when there is no ACPI companion
In-Reply-To: <20261117024612.26239-1-rosenp@gmail.com>
References: <20261117024612.26239-1-rosenp@gmail.com>
Message-ID: <7600f205-38c9-44d6-999e-29a8a3bf28bc@RTKEXHMBS06.realtek.com.tw>
Date: Tue, 17 Nov 2026 16:28:01 +0800
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Rosen Penev <rosenp@gmail.com> wrote:

> When the WiFi device has no ACPI companion, ACPI_HANDLE(rtwdev->dev) is
> NULL and rtw89_acpi_evaluate_dsm() still calls acpi_evaluate_dsm().
> acpi_evaluate_object() then returns AE_BAD_PARAMETER and ACPI core
> warns on every probe:
> 
>   ACPI: \: failed to evaluate _DSM e8c3a8d2-694b-004f-82bd-fe8607803aa7 rev:0 func:10 (0x1001)
>   ACPI: \: failed to evaluate _DSM e8c3a8d2-694b-004f-82bd-fe8607803aa7 rev:0 func:6 (0x1001)
> 
> All callers already treat failure as "no policy provided by the
> platform", so this is only noise.  Bail out early in that case.
> 
> Seen on an RTL8852BE in a desktop PCIe slot.
> 
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

1 patch(es) applied to rtw-next branch of rtw.git, thanks.

badf4c3c7679 wifi: rtw89: acpi: skip _DSM when there is no ACPI companion

---
https://github.com/pkshih/rtw.git

