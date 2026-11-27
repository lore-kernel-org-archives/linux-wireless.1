Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795751881;
	b=TQcveUBRycJY/uNxfRUEWabRoatm3XFV8YrWYML4gCWcy75aAg++072zuVVELfai9t/c
	 3BDdHFBvCxnSuwqTOVFFzhzi3ux7ThctlS9gGnKf08STUReRpybAeaor1sNyNiUxixmql
	 ZJw2Aa5ioP/T5oQeS0AnHRATFyNspEjU+oA2ITwZye0JThFzjuBEyBqMUAP4dkb2ulQBu
	 ZwMC+c4BiYOroZjmgO2BC1jgi4f1lqmnVYJ4+ZwFd3YcZB/WXsUGjmiWQ7a2q69M7AVIG
	 dh0+jkPa8x9LA5OWZXx4dOvZ/BrgniHpv7TagYIvuBW6W9SVAGUwIsRqf5tlgsB9DPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795751881;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:In-Reply-To:References:
	 Message-ID:Date:MIME-Version:Content-Type;
	bh=9bniZOGcPBIw4COzZs2qNSk9074rw9bLWzFdLjw6lqc=;
	b=at9oVurbLreC7P4m7SlMa1MqiOMuLgoEhiorAUo0oLD3lEKLrPjHzJedJbsq4DzmsY0H
	 GJ515ouWCZISzDkr9uszol/B61hOzB6AShNoHJtDuhmy+YJUPNXmilJ3KN1a21TfOWcNp
	 Z6If6fKjNE8PwcYJpXIkHam1oXYqfaRamTm4TbdjEpnCx0iUVseniL/Cbe6hovmwImRdW
	 JP8zExY6Y9e+w878P4mUcOQIJcnC++TtE4v1+igXHDyb9aNcnJP6fNHImNJuM5E9qIzoQ
	 0c101nSpm/ZzVc/a6lFrS521NmpLQ36XATAHvyhHXCwXAUM3obt5dOebwYWdBRrDHag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=r5qYFMDe;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41523606A31C
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 03:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41523606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=r5qYFMDe
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AR3vrRwB604130, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795751873; bh=9bniZOGcPBIw4COzZs2qNSk9074rw9bLWzFdLjw6lqc=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	b=r5qYFMDe0oYDq+Eh+6UhlzU74fuL07CqBtHn56hbmsI9VIBYDoIP4Nk333BGZ3lUS
	 vMMEEuJiqr4ZSlHYn1xeBREGZT5QHe87k6SAlCA0WqyXYbFZRd+TkBYCIXXtHXDxfI
	 wXw6BzEog1M2d4XrLLAcvR5xS1E05BerbGD508xserxxG+ShPYhnjisqmt6OSniNqy
	 /OCVNkJnGBr8uhvhtnm6Y2wYNAB6N5fB1Qr/3z0jvn9gFf7Z15LXa4I7dhPNfYhvPk
	 mTxFiV65Er5T+yvV+Ek2jmJKeLqZvO8L35A0jDJZVNDae3IMMtMujwdkEkHejbQdT9
	 OMrArcTDle6cA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AR3vrRwB604130
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Nov 2026 11:57:53 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 11:57:54 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 11:57:53 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Fri, 27 Nov 2026 11:57:53 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Ping-Ke Shih <pkshih@realtek.com>, <linux-wireless@vger.kernel.org>
CC: <gary.chang@realtek.com>, <spam@acio.nl>
Subject: Re: [PATCH rtw-next] wifi: rtw89: support TX of BIP-CMAC-128 management frames
In-Reply-To: <20261124082717.27780-1-pkshih@realtek.com>
References: <20261124082717.27780-1-pkshih@realtek.com>
Message-ID: <3bf2de19-b0d4-4a0c-add0-33ac71e7e0b0@RTKEXHMBS06.realtek.com.tw>
Date: Fri, 27 Nov 2026 11:57:53 +0800
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

Ping-Ke Shih <pkshih@realtek.com> wrote:

> From: Chih-Kang Chang <gary.chang@realtek.com>
> 
> Flag software generate MMIC header but excluding 8-byte MIC space to
> support hardware TX encryption of BIP-CMAC-128 for WiFi 7 and later chips.
> For WiFi 6 chips, return not support for non-station mode to fallback
> software crypto.
> 
> Reported-by: Vincent Schurink <spam@acio.nl>
> Closes: https://github.com/morrownr/rtw89/pull/135
> Signed-off-by: Chih-Kang Chang <gary.chang@realtek.com>
> Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>

1 patch(es) applied to rtw-next branch of rtw.git, thanks.

2cabec574414 wifi: rtw89: support TX of BIP-CMAC-128 management frames

---
https://github.com/pkshih/rtw.git

