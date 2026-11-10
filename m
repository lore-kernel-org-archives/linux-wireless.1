Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347790;
	b=f7E/svzVIWMpcaqL9w5IKOfZCOZnik9CildFXhr4nzLMapwmBDUbrEwdDXLp2RJBjX1F
	 uRGPlXAwCVKjiqcOD0Ig87xw+VW4U46yYWk2YHaLhxEEvgcy2emfKA5aVmho9NMffYpVB
	 N+53kURBInU6Ev5nNHLrc6Z1eogew3OXW54C7/CQSFBzjDCWLcD8J45o/evohLYwY2pH7
	 4XfHJjfikhbvUO5W321GKSaLDcp62wE7lRL+j9pZjwEWi6y0bKpqDKx1GYNlf78L1GUFp
	 26wZ1u3hCzVX9u9gcsHjl8S+t4mT4nAt9gC39O7hgrcShOOoMiBj5YHe0783ihj89rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ra3QtoJe+wCuwUEfgDTPeqd7lp/+YO3cFy9zYknvbsM=;
	b=leIjliCfGErEc57HIqwJmNdsVAelm/kqPQeN1T2Kfm6kBP02bJrqOeJQitOVn7qU/iEp
	 pyTQ48Z/G0Q6O3IVURMhEJmSxjW4N6YL1QF5GrfTIqntarW/GcyuEZBkfh/oCXHN1tyGy
	 LJD74r7mrqrT2MVUyXg4iKqiuzCclZYBmDtgWNP29RBTRKGZhOgpNqSXi6RD0+Y/G05Dt
	 3QzsGr2S4FT9vPh9fBglmwqml+f/2qOaVLpmeyZWHsa/ez235ACaOIWK2o3ds9q9dEtJ1
	 InTXEZJz7ZNLiL0Mgm5LmD/6Hpqrqpcndvmenpm4DkT3egPolYUENLBVj+ewR4ENqYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lo3MmjzD;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DA0606C996
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 21:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41DA0606C996
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lo3MmjzD
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4922523d1afso1562112f8f.0
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 13:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794347788; x=1794952588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ra3QtoJe+wCuwUEfgDTPeqd7lp/+YO3cFy9zYknvbsM=;
        b=Lo3MmjzD66xIMCjGFcAGJ5+d8S2RjC3BmJp5rNdyYHSxnlCbGgcHfa2ALiNjxfGiei
         oR0U/eXV+jZXK+8lACQiknvMzXQALqXZoO5VITTOZGQ2ZU/7DxgqPwwGRcr4xGv6IwDc
         ah6dloCteuJhuC3cH4aevOtGmenjGl4Q3FGaWpVJ/8WB+iisQ7CS8mS9LBPpyYyyvEd6
         Ohdt7sbBS55p13esU5pAm1KaF57n9PLDMvNc53iKX1c78XslXnLg0c+x+NdtZj8zcv9z
         BlyPRF+CDmhlp5xE/4wuhWCt9F02kasBmhajDC4z7bifupMcWClnRbkUDqNzSEKoWk/D
         gxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347788; x=1794952588;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ra3QtoJe+wCuwUEfgDTPeqd7lp/+YO3cFy9zYknvbsM=;
        b=ykUNt+Bw+fyh9H7Wubb3H22fmwQw8S8YznHc4+si8Ksjqh9nS9HBU70D9v8lmRpUh0
         mVrBR7W5mJ0zRCoCcmvXst6Lye2BM9d9eEavSC4HV8oRjIoKVZs9VyIokoaFYYF5WPnM
         uOgefQHAj3hhg74OUTp/APBI70Z0ftYOsHtE7VoBAXEuzqLF+JcPVBZKIoPPWW5gJAaH
         7mN3IWVPH4B/J8Bhe16bV6P6tAC99CEC7ApG3l8jGMst4U5J3gvu5hrLShOEEXXyy9Eg
         ChyyKDglE8x2dSVE71QrTU+NCgtEKgBIx3xdbkn3QUgTTj8sFE0BM27MiVsOXsvGKR3h
         tL1Q==
X-Forwarded-Encrypted: i=1; AL+hErGFsNcMolc/JEo+p+1vKEnYTZC0xB4Z4P/r1/p+Zuz75/NlXGttqFCm1Yk/my/3MptzcoZCaCs6P6x4qLkNZQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9g+hFlX9c3LdKfxMrVu57xklOEDTQkThJ/hUoEMyzWZke0i0aZ
	7/7HgT0LEpQttQilMEKcmmm1JkC3D/dQmsy1zut7nUsoulX3lferOrnE
X-Gm-Gg: AYBFou2I2dxF/QNnqF6iyHrk52ia4ryKdaoHy/AqiKeYwanTpce0567lEfKJqMICDht
	zaGm9sgLUT6x01ducrtdX5EEbfYtD4Qa8yXilKMWxWDNmCuh+O6vX1kC+cPTRN0DrDrd+tS/dMM
	d9KHNHZM0PU3zzJTzKUR7nyAuCesd8oWFGRSsIs8g31naa7wzr2fgwEX3iJ2NCQN41jUDA+7r33
	SLfpHz8g92b4KR7NVtGzPa2tONGzOl4tZ8SkMAKVMu8h573CgyQ6p70VIQTI5AxqjFq7MiZjdcw
	Kk0BTEbiAuCpuXIOhO48k2OKdZHzIFasAXYvQmkPkR9O3/MhWxcHhrxqc/iynwoUq6A9Xjtdi78
	HlqWF/b5+Zwi+j0c/b6M+UxLTTuUViDf6+jUeMcUZslxf1QF6UGm4VJ07AKRXFPMDuwG8A7HssP
	i5iZYU2nY5MT05sJrNRaKfWa5DwSAVJjGeOy4D/pOBA/R0/wIVZvyR3PBVXu7UodyK6GUG1xwyL
	RxJSgtZlYUq7ToWyq4BHdTD98QA1RG/xs3A14Dt+WJnVoF4RNyuelonwgU8lcHjqls9ozEXgOnO
	HstN8oZBmSoO+L75gvrYHzvQe/7f7RRsyX86wOHGi929WIuQ
X-Received: by 2002:a5d:584d:0:b0:487:6f2:1a4c with SMTP id ffacd0b85a97d-499c7a25644mr419632f8f.25.1794347788659;
        Tue, 10 Nov 2026 13:56:28 -0800 (PST)
Received: from localhost ([5.83.201.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c4e07sm6762009f8f.49.2026.11.10.13.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:56:28 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] wifi: mac80211_hwsim: remove extra trailing semicolon from a statements
Date: Tue, 10 Nov 2026 21:56:27 +0000
Message-ID: <20261110215627.947448-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a statement that is terminated with ;; - fix this by removing
the extra redundant semicolon.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/wireless/virtual/mac80211_hwsim_nan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/virtual/mac80211_hwsim_nan.c b/drivers/net/wireless/virtual/mac80211_hwsim_nan.c
index 6f90856099e8..21330850754d 100644
--- a/drivers/net/wireless/virtual/mac80211_hwsim_nan.c
+++ b/drivers/net/wireless/virtual/mac80211_hwsim_nan.c
@@ -278,7 +278,7 @@ void mac80211_hwsim_nan_rx(struct ieee80211_hw *hw,
 
 	/* And deal with the lack of mac time stamp */
 	if ((rx_status.flag & RX_FLAG_MACTIME) != RX_FLAG_MACTIME_START) {
-		u64 tsf = mac80211_hwsim_get_tsf(hw, data->nan.device_vif);;
+		u64 tsf = mac80211_hwsim_get_tsf(hw, data->nan.device_vif);
 
 		/* In that case there should be no timestamp */
 		WARN_ON_ONCE(rx_status.flag & RX_FLAG_MACTIME);
-- 
2.55.0

