Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795044680;
	b=OapBReCuxHmgzgjlCML/P5vf5YogMqFPYdEdwP8ILqWcKAegfR/fbT+L/xKK+V2me+F1
	 vNm+Cdmq1fKXk/aKkWU15DbCNUMwx/S2RnD0MhAwfJSTLctg+4srTlkLSJSHDIuOdGkaf
	 gS1my2lBaEw1kTSjXQPP1aiL91jdT529hVR2t/Y/SFGj2QTn+0urydA9Gn4cJqryZ9J5Q
	 1CzFG6DGCDw399mePZwUERa038d4PmB5FspX6z69uLQbQBgdXfKnYk6g077ndFWiIXdVC
	 +uYTfLIn3I56hdYYpHuWAur/2cunVXFgP1ymzyHRxvdlFNnvWlgMhdZgovVPcAFkhxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yeqZPV4CNEvaMB7ZS3wfw1p2P9NFjypMgMxxf6sfbKw=;
	b=nrd8qJp+173dPgfLjCQ4UX2nKVX2wlv1PRpOjAxzdM3vGJetls+5qFiUKd6TEKSA0Som
	 6Ct6lb3Y2yJWIvaFv3AwiM/oI98wpDU+QimZx3zMT0gtbXZIHhLHTRlaoZLS/8G4byfLO
	 tI64VpRGL4sD7HYBrvXKsVLQV5QsLPgNmYQSQxBjuet3j5aZ/4EAJPhrapQIsoDx5knpa
	 4mRIuchRxSw76ncPwEb40J5jckPbEHhWiBi2nmZ+ptp73hFMguKPKWOO728FIwrLMT603
	 XnU4YRfCB6ucD+XSEB6RUz0bibuDWEy9rFdnpCSQFtAJtwvX5tojClMFSc+gjS54Gdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qU0ugryG;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401D3606A325
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 23:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 401D3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qU0ugryG
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8c70c2ab5a2so306815b3a.3
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 15:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1795044679; x=1795649479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yeqZPV4CNEvaMB7ZS3wfw1p2P9NFjypMgMxxf6sfbKw=;
        b=qU0ugryG54DM8LxfFtFaxt7jkXblBnuWy3W660KqroS9tcZwreIimFjvVgxiXy3AAM
         H66uvzwffv2QgTS7Aama6ociqQnS1wHWujsNEhpPuZIJiVpOnbtJlyfZQaN2gloNIae7
         bHmNDbk3ev9mEvXtKjyBpDJuIIpk8MvDCd7JaQ+vD+VkV4iA33v9j+NywCFijR1m5983
         zl1b32EYKGZNCUIr8trZ+GY+6L+edzHvU+beeFy4T5UCMu8aBt2AFweah1VUARMDojdo
         KhHlvRrnsv0C40aeC4z12r0+8hW7H7NqasVFiggN8o1wq8uvbCZ7RpOi+knHhLYu08ex
         t9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795044679; x=1795649479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yeqZPV4CNEvaMB7ZS3wfw1p2P9NFjypMgMxxf6sfbKw=;
        b=WDC1jxXGbyY8Upmh5L+wgPSkqwXSzDA4ALz+EKrEsWnSkknHWCUiuqXSXE4DmfWpwT
         0RtmuSdzEGPFfYPb/74RpC6i3o5yUBkfKqYFTBItn3yT5m3VE4Nfq2dDb+gER4XP+MzO
         1DyeHXarlu8mZpzjRyaR1mRbHSpWda//Ykj/kxxN0nqj/QlpZ0Oy+Sh5aqZrWV4rmMFw
         /MwYCwS0tFTrDQ/W5/Cp1lr7TQr9ReDxP14BpLdIoG3hDrCRAPc4N4eQsJWm91/IFbbK
         KuHdO71sdKWhkJp7IGiRjQQS1bYQQicSOporHAn2eFo4d94YXGsjelN/3Qa62BjnsCMA
         01jw==
X-Forwarded-Encrypted: i=1; AL+hErECB9OmQfmvdiIM9bsilF9UP5ay5YdMttbZ19RE5/1gPaGg7EE9+CJE7WF85Lzc/DevVDTniKYf/EGK6LCeAQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ih8wI+WqIt7YViZMF3M9KZHDxl8VdLWznrQ3eC986VH1Kgydf
	lmk4shJs0ENPHA/kPKQYRxNIhq6pqKeFqHgopk0SwmG/HW82WISmR/qBm2Kj8/yYqp0=
X-Gm-Gg: AYBFou1CG2COH1Xhi9UOictvT5GYnp6QmI93ZVoAWkZCuy1KS5fQ5Glm8AL8h7WxEvF
	bhOxUWr+BqSncyZ3ta8L5IeDS1wTonE9FTuzC5+imFnqNDlcFftGfK+U3JJczBOL+3Ga13KIl+a
	S3PKb8g3bNSD7u2e7txDYgqoN/QCkYHOlZ/HqsR2QlcP4gR7b2jl5nBcWZmz82+Mih3c9WdZI2f
	2yUvbj58LK10MkQMB0Z3BxPFmTpEgh9didkOYIx7jqisClRIy/Ntc/9ONJka407ovMKA8JGy+51
	Az4dF0wuqEnehgZ2TP5KzFzIrh4QpBt2qaP3x3D3WcipPxwcYEhSClA5+av9d+bjFK+ZlWamLY7
	gGTxFzFxNW217PVh/F1tyMroy85agnnRGvzm7Y9aLslSMdVTKvuQyhrXeppLWRfBD3JSwXlaIN7
	2UC1Xz90m0Bzwi6lbZnwHQ3/dO+tVd8qnbqvjHaUkGQxruVHkZNxwV24pyHOUwCgO/1N2AkVsf2
	rOtVtxB/v2tLh/Ge36qN8fzIHIo75zxkOMJKz5tpZ9wX0AxVYcXlKR6KOP+WzYG7AmlTd7iGjpv
	FEWixIntKxpSGGkHb3UcIwwBI6c9R795o+UzQBTWjcIzia6E5oa08mKdGYFRZ7pkSWobMRkc6/s
	cop1L1Q==
X-Received: by 2002:aa7:930b:0:b0:8b6:400d:7cc8 with SMTP id d2e1a72fcca58-8c5d40ffb57mr3624145b3a.30.1795044679534;
        Wed, 18 Nov 2026 15:31:19 -0800 (PST)
Received: from mma-H9MHD44.mymodem ([60.227.235.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c6660c2e4csm1467822b3a.22.2026.11.18.15.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:31:18 -0800 (PST)
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: lachlan.hodges@morsemicro.com,
	dan.callaghan@morsemicro.com
Cc: arien.judge@morsemicro.com,
	linux-wireless@vger.kernel.org
Subject: [PATCH wireless-next v2 0/4] wifi: mm81x: support v57 firmware
Date: Thu, 19 Nov 2026 10:31:00 +1100
Message-ID: <20261118233104.1640855-1-lachlan.hodges@morsemicro.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Small set to support v57 firmware.

v1->v2:

- Resending now that -next has been ff'd

lachlan

Lachlan Hodges (4):
  wifi: mm81x: use guard(rcu)() over scoped_guard()
  wifi: mm81x: use the BCF size advertised by the firmware
  wifi: mm81x: support v57 firmware
  wifi: mm81x: drop probe requests received off channel

 .../wireless/morsemicro/mm81x/command_defs.h  | 38 +++++++++--
 drivers/net/wireless/morsemicro/mm81x/core.h  |  1 +
 drivers/net/wireless/morsemicro/mm81x/fw.c    | 27 +++++---
 drivers/net/wireless/morsemicro/mm81x/fw.h    |  3 +-
 drivers/net/wireless/morsemicro/mm81x/hw.c    |  2 +
 drivers/net/wireless/morsemicro/mm81x/mac.c   | 64 +++++++++++++++----
 drivers/net/wireless/morsemicro/mm81x/skbq.h  | 22 ++++++-
 7 files changed, 127 insertions(+), 30 deletions(-)

-- 
2.43.0

