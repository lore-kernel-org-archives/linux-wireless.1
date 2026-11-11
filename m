Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794432763;
	b=JUoGzmFPTPJZ1ow0KwxkpqIlGUIoJstdGyuU1ow17VmOtQF4god1NwecQ+shb54Ucv51
	 jS7SmP+gSyGyKFqZJxr61ay2VlCfQYhLavaYYv4oIlX8hvWm/of2rF0bsBt4Eu60GHJqD
	 iujBqOgr6dmmg7ECYj+jHSLt1+zmbp3/fsNVufnEAkNuEyB2/YWhNV71Yc3c6NiQ5irRN
	 KqBZabFLKrr89n5DQuqgU0iGOBakYsrSJeba0SNjeQwHGFTK6HVcr5HkYt7qg0RcrkGq/
	 E0hSnKNRWZ08TM9VS2BT5LKEBr6xgK7uXRP1GglKvCfxkhK4ICT6v4TzMKAjHYALSEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794432763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tpcEjWIOQm4GrhqiOryBSA+1vEUFEHl+y2QbhN2/yOg=;
	b=NQQsBt38wAu3TU6N1q9MU92uvUUGEI0vcOfJBTCpF6i7OsVLVOY0Af7iotxfZdFGLrU/
	 QgZKezSv6NwfOqURf8WOb3sn77dXVJoQE5POBrKtTC6mrNboKQupVTwAdHybD4AJHLdkz
	 3QjeVjSvPdM1r2hnLnD2sEJZA1iWRX9rzcvtTcMKZJcdPXZp8AlR5q7fJZWMtRGsWkNYS
	 UmbOr8Hpl0ZADx72tm06/N1gYvRp4cnUifb6Tqe5T0Z0LDZN4dc0+hqfmMWeaAoggGBFB
	 fDyqDmNHnLKT5INHEIdJA38ljGrATMFUS8/uFXNassHG9vSwhTMvTbHtpUWKVSde8Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uzlczsnD;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDADB606A335
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 21:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDADB606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uzlczsnD
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a215e64962so40416555e9.1
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 13:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794432761; x=1795037561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tpcEjWIOQm4GrhqiOryBSA+1vEUFEHl+y2QbhN2/yOg=;
        b=uzlczsnDtyqMB79F1SPzfSiKvsaxSztkSTc1leJX8Iqw9Jvh+39SADp14fxg2enCMI
         gYNk0s1Joq5RN/v5fXbjB74DR4B7AsURSN8cnBsRLjrg1z/clUwBDNHJoQkTmvjeGsyu
         R0aIRIMAqMARoufcYIlfFB4JhRWakfGFC4WA8aQS7I6m/xJqcwmYsX7FdiXFumvTJGct
         KJ3mG9I/zub18/DV6fvhB2Rcet+2vuJ5UgScsmmFirT8moG4PQPUAPOQGYXXlE1aKxbn
         h5FQuE13ci/blUwJegotGXA+kpm3B0UZSB9x8W50Us2pPA9xRZS6ccwWOWLhnRkdF9Oy
         E7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794432761; x=1795037561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tpcEjWIOQm4GrhqiOryBSA+1vEUFEHl+y2QbhN2/yOg=;
        b=kzYbNxX/wet7BFrWXif7cJenhrhS1O5IclL/VZCs3/VPSQIBuNyM9r/fgOGq76kLMU
         QpWQtCcZm8vK59WiaHOaDpuHPbj+ih1ttuXVtVgOQOzXA47mpaefrjnpos4rjpPtVscP
         gZf9fanX5pkWA6XLXeh2zKB75zwdq5y2GrKOeYORxSHsnkh38hvTINLNZOKdRPL+ewiC
         8Y5DvsHiJ6xiI20qmwu8JdS2fVV6snbSBSCsj3SL4RiS6cx5HgQhnM2xxOInKQ/s3nV0
         CWFfmpE+/J+BAO25SVxgJmG1l739p0K2Hme21AQu/KLhkuf7ZeKBSprfT00TswLwP/P7
         D3sw==
X-Forwarded-Encrypted: i=1; AL+hErGz8JsL7y4LAvYi95zoGkLeAeoZc0ankY7VddlKLVyMKSgZukEeQduNE3TKpM3G6/+9tECoB18dAovXfoBCVw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9/dmsl8fX3WHGGSxY4Z0DHqEoqxnWwigU1yA4/444Fbdw6I0h0
	2ONfaVc5lF30lBUD6NNTljWtOgPq7x2Ycx73U35Sj/ai1M7CK5oulJDX
X-Gm-Gg: AYBFou2A7tbyYXujkauJQhTo4Uz5IqHoh5E+aTELeJ7YbiGRnFr1qCAvdOML2yA1G9v
	oZo3yXYGPeszOqgPUUkQhRv3OQQNZNv3xcoPVOuI4Rf/ad9JAT8kKhbE4JjNhIbF6g2UI2xm2bj
	0HreYWWDSglfQWEKYtWclvBkOyiiRKOZArLcdyw+eAdLjpsY6YseeQkIXoHT7+tvcdjhA5YpfU1
	v0w81P/KNgauGJ5a3b+Girbdq8oKAyM5f/ps8AG6AnCJFNzEQ9EvIextmszRQniFi3zATayKxLb
	sl1eVdbROXK2MVhiZuX83BpfBsRxVN42Reh5P0PUd47yUcRvO6yOLNtEiUFlTuUnkNKcVBMfmwx
	w/1mRfh5FJtDaf9yXg/zvXIS6NjtUE09+CBGGj5HuXmbcFpk3lqt9gzN+6FRiGglPc0KhGqFMGi
	xl5M8khQg3FnV+hsxCuqvahX7Ibl8Nv+ng4br55TGgt2zHOUUBcJDHW4gBtySpLlCW68CI0xMba
	pN/Ydd3CVnxrB7cxVal6QHO4UZ+ze2obuvVXHDNTOABjGHxn0No4kaC8k75f6jht1Dfmd/Dbw8f
	TXCwl3vo0oQSNYOAANGXE8cSwIx2M/gdyZo=
X-Received: by 2002:a05:600c:4e45:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4ba0936efc4mr70914265e9.14.1794432761116;
        Wed, 11 Nov 2026 13:32:41 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba095200c4sm36726845e9.2.2026.11.11.13.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:32:40 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next 0/3] wifi: rtw88: three fixes around the firmware recovery
Date: Wed, 11 Nov 2026 22:32:36 +0100
Message-ID: <20261111213239.569224-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Three fixes for what a firmware crash test showed on an RTL8822CE.
They are independent of the channel switch series.

Tested on rtw-next (04c998418722) on an i.MX8MP board with
PROVE_LOCKING, DEBUG_ATOMIC_SLEEP and kmemleak, with hostapd. The
firmware crashes were triggered from debugfs on the RTL8822CE:

- patch 1: three crashes with an associated station interface lost
  five reserved pages before and none after; six crashes with an AP
  interface lost three before and none after
- patch 2: an unbind after the crashes warned "Have pending ack
  frames!" before and did not after. With a test build that drops
  every TX report of the firmware, the unbind of the RTL8822CE warned
  before; after, neither it nor the RTL8822BU did
- patch 3: each of three crashes with an associated station gave the
  "sleeping function called from invalid context" report before and
  none did after; the link was back after every crash

With the three patches, AP, association, power save, firmware crash
and scan tests on the RTL8822CE, RTL8822CU, RTL8822BU and RTL8821CU on
both bands gave no kernel report.

Mehmet Fide (3):
  wifi: rtw88: free the reserved pages of an interface on firmware
    recovery
  wifi: rtw88: report the frames purged from the TX report queue
  wifi: rtw88: reset the stations outside of RCU on firmware recovery

 drivers/net/wireless/realtek/rtw88/main.c |  8 +++-----
 drivers/net/wireless/realtek/rtw88/tx.c   | 20 ++++++++++++++++----
 drivers/net/wireless/realtek/rtw88/tx.h   |  1 +
 3 files changed, 20 insertions(+), 9 deletions(-)


base-commit: 04c9984187228904f222681661c50db3f0c50b71
-- 
2.56.0

