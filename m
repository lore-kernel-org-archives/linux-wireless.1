Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795071712;
	b=FtdhvbUtk0PKc/tbp5cP6PBrwI8XofJUitF00amZOxiuFYJreyTXQg5LiJe3Qqbuw74e
	 KbGu1gIy9XAwLk/CeDrMVjwA+40G5l/tdS+KWXmVAnO1lfRZMXRwx0TQcB/Lm8xQLk22t
	 SMXFx6xXVXfAZA7klrNmVt2vdj8/jDU/Ohd5/jTO7vxSxa+eI+4QBHR03dL64HyMv1nMd
	 2L+D/85mwe3D41zuIwtmSySrFNc/XDAo4h6bvGsMGDTrV83D3D8OeZhjs6UO2KbrSZMO4
	 WjGLSLtuzCHRT4UG/rKgb4Fv/qDzUjd+e4NYFpnpQAfZMZKLPswQq94AdpKbEcioxyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071712;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Subject:Message-ID:Date:MIME-Version:
	 Content-Type;
	bh=x/GDVw6LqLmX9MUWUF18DFIj/MG7BCo2ZF5/o7JA0iQ=;
	b=LBD/3uy10dA98xLxS6o3CAVRewwpsEULovcC6SiXu0h84WgPXrFGpTdjuEe0OpHAWGh/
	 I+Ilz3jpWHaidLlj3diHkZdX7lO+sCyfNY83Ck2y4Uof0TXZGUle5FcifoK2LX2BJvBdj
	 mU8sjgoUttmIvDu6/FyCsfaZxpjSnewf1ki2m+t8tuQAUpuLvGWPDfJTGAhRQjzdwWWIj
	 /BT0+gVmISQ5PfJDl5G4E14omV3mlgM2W/FDCKyk6ZLzWjFYN59rqW5pGBvwQaFxnZ8bQ
	 LAZrbCuq0Z+Nsn4KCb4k77mphDgjg4tZ6OLdbuvjN+qpY6VkoWL8NcC7zp0OYYtV0Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=lsWBukkO;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96997606A325
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 07:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96997606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=lsWBukkO
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AJ71hSbA2096502, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795071703; bh=x/GDVw6LqLmX9MUWUF18DFIj/MG7BCo2ZF5/o7JA0iQ=;
	h=From:To:Subject:Message-ID:Date:MIME-Version:Content-Type;
	b=lsWBukkOGF6xHCmQG2+X8hDOm5YjhUmh1sssgB0SZqnaCOxC0m9OscHtGHL+qvmEg
	 Ty7w0Hp2iL2HBLUCGBLiuNYg1zhFMkCKh07b0vVdhklU2eKLzVAS5L6B8W6M0oKhmM
	 ZWn7cSDPH4U5nOELPhh5Fifrf5FEkAjeEsf2wcvTkS3vL5sqNTK9XtlNjnIQ1ALZKC
	 Xh8idaVyYrS33T23LKEvpqc9VE1fWnV03WM5TxfawY1tQjEwBqa0nWKmz+GZNYQjdg
	 hEyZOzcm9ZBeQa+B6d3IgVvYhgHfzNQz/7f1JDSYrEDr980zyD88mbj/dig3KHo2a0
	 5S6KoVSJ0Cd2A==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AJ71hSbA2096502
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 15:01:43 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 15:01:44 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 15:01:43 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Thu, 19 Nov 2026 15:01:43 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: <linux-wireless@vger.kernel.org>
Subject: pull-request: rtw-2026-11-19 (for -rc)
Message-ID: <94f42489-de6f-4c14-b497-a5fabfd75579@RTKEXHMBS05.realtek.com.tw>
Date: Thu, 19 Nov 2026 15:01:43 +0800
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

Hi,

A pull-request of rtw to wireless tree, more info below. Please
let me know if any problems.

Thanks
Ping-Ke

---

The following changes since commit 763b13f622e2758726e8e3ecaef819db8fa0430a:

  wifi: ath9k: uninline ar9003_paprd_create_curve() helpers (2026-11-16 13:33:08 +0100)

are available in the Git repository at:

  https://github.com/pkshih/rtw.git tags/rtw-2026-11-19

for you to fetch changes up to 685dc94d51ca427c0ae5983491916b1279617047:

  wifi: rtw89: coex: Disable pre-AGC for out-of-band links (2026-11-17 15:21:16 +0800)

----------------------------------------------------------------
rtw patches for -rc

Fix regression of connection drop immediately for RTL8851BE (rtw89).

----------------------------------------------------------------
Hao Tan (1):
      wifi: rtw89: coex: Disable pre-AGC for out-of-band links

 drivers/net/wireless/realtek/rtw89/coex.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
