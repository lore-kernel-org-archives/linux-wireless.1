Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504775;
	b=UBan+rD5a5dFAKsYHqBm1E89cGnHA84gRKpJuWMEkS6DFIr0XQlgPK+wEOBu8m24xY4K
	 UGPgxx+RST63SMmQ5UaIosxkrePTVBtOGO7OMgIIXOEe2bnEdbKGWeaTJVzHr2tg3omQK
	 LIkNIEOynggS+gkDwV+3LKpv4Dpan/hy10QtigZsSSFmPY8kFHa2Du/RLFHGru1+j2sEB
	 9jyNNfCRGbCcwir6cCyT+N7ktajoumJrNPNHcxP+9+hj3livXfEXuxXS96qTxSjIlW7fV
	 GVEa4dph+kfy9YhwXML1kj6C8q2R5r6x2C3QbihNfbmBNTlqakBL6Qopwcf7SoN9krg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=sZa1vSArHC9E++/fr2qVRUW6TrWTM9JsZ4c6YTVfZ3c=;
	b=s/FNGUgideDCcW3y2oBu9/hxW1H9Qis86RoZQUAvtlQZZyij/VIneySnZEBK6B6ipa9z
	 kQSU4hzAR5P5HaRl4ylghTNGNxksFGRoIrG27eLjhtXkYXV1uJO0NJdzu3t6XeipjwJYs
	 0AraMwxZWtJ3m+JI5XJUpkahALa6iNZV69sf8+5ebqwc8tEl1Z8W9B3RwCBOM+uZ3wsEL
	 Kip4eaNqg2vr7C5J462Z5Bzmu919xotxOKw3AS1Yh+eb3gIbgqE8sR2H47SGxh+0YcbuH
	 IJYfDsh0l9/Zto5ca+7dLysybUpRw5aiuDWCQbLcog4JM++hZ83kTZhGLfUzjvOntNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fe7TnP5Z;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2C8606A32D
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 17:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B2C8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fe7TnP5Z
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso4695a91.2
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 09:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794504774; x=1795109574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sZa1vSArHC9E++/fr2qVRUW6TrWTM9JsZ4c6YTVfZ3c=;
        b=fe7TnP5ZxNDWglaP57PgZbIqpe7J8CdJci/DQpTyF4WJih3g8N9XqD1uIA361Gxn8m
         Mbo7KJAxM43PPdJgIS398qRVCDJ+tmxy5Wq0eZKWetbcs3pti5OfX2uze8AXJ1KzZYaE
         hJIRm0zcR//t9uxK4rXnhpQQl+3JbXkzDQRU4qI4Ts/KI9QkUTFrJ5/VQaTajcuLPOs9
         Xa8JRwf5IhIlrwk7crvvUIU9bDrmPdsob5GzJsW9wZbM3uOuceZ/+Erqig3WKj66QIPR
         apLkFaCdsRRuwxDSGPaGY+i9sMjbc+ps+N445lXsBwksBx6DInA9BnPkj6egiEgIeb7e
         r7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794504774; x=1795109574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sZa1vSArHC9E++/fr2qVRUW6TrWTM9JsZ4c6YTVfZ3c=;
        b=HpJ1AtpztPr/K7DbZBwR8RE+cp8tYCqtVkl4ArK1BOyHPYaK8fr/JJ2xibwfkuaist
         iGZVgz3zjCPTnbm5Y/+/W+QMPARNWdzQxp4yba9lb4SnX8NCIe1K/mPPrrA1nLeGIgSc
         a4y/LglBNShgPKIl7gX5EfgMYWOlmY63Q6hSIIvfE5bXA9tpH9Gd1HYxfJRdiDl5w85P
         RoQGShFVEIDN51V2W+5a4bDLLSNb+JZOm1Cs039xtXlH2tCF+enD3hP7KnBvhdGJAZXn
         AiVUTo8cBMsvVBGNgTfGK7WIolBmMBEuxa1y9VoCcheg621nNwtUpVYn65VAxrPcOmXW
         pmeA==
X-Gm-Message-State: APuU4Z93TCj8abDt6Wn87OHMvnP2gKmhcoQ8Q8GJjg1a7lzpXxpc7Yty
	qLuIR3OzOzyQgN517UEr3X8nCVad5Iy//IuqtyKfLLpo72Mg6EE6Btsi
X-Gm-Gg: AYBFou2nKsMwr2S16oYfcJJJOvH4TrkJXjsZ56Q/oG7wL1ip4C+bj+cdiojF7dEIIsZ
	+wBf00Ar9pdOUMXTDoKopqT24Wp6slaGKiUO4ySTZfZObaiNcSMaXZytbmYQSZtjQnBgp0WuAo2
	OPLwgSRzn5y87MWEngM2PcPUqod/5eR//j793dIIu3kgi2AVWjIe0tMq+Lmzq/lGf0VlMg9O6ra
	wWlWGsTQBNVTUv4uQTy9dE+jvrdn+qodWItFtMnkMjbqOixFMPiSzlIQDGOJYwrxNGEGAcf4rnm
	cR5BL/zvxwoBqygDDOKA5xJSzpLkSBcj9WD2m5XskwUCz/riKKxwkLmh3zEf/G5gFa9iLSQ07gC
	q+njzfSjLH4XPOD2sLaJZh4iRlPb0FVXPvp2EujuICgP0wDSgSNuradUfat9zuGMvqltsg7CisU
	7IyKjjLldf+mcpD2Tib/6D2QUFTLQFx4Na5NHTjX68v9stgCSk/33syAeMktwuwJlmFA+sb+twO
	kyCiiBCwaVPg6wNFt4erm9db5wUTCqFRC2jP/wdgpqbBNNK4XVbCAVn+YTKaVVOzLbjNXB3EJvn
	Vk7mAI97IAEZmLZqUWLlS8hwXrl8u1ktcrH2StC9EM62VdDNcKs5MtSS4+c4dvLSdYgRX0XQP4r
	EVQWmvwLXqTjBJftTA//XBsib433NxixtXxa6exAO7bJi
X-Received: by 2002:a17:90b:2fcc:b0:3ab:f38:2b41 with SMTP id 98e67ed59e1d1-3b182f20049mr6375619a91.39.1794504774518;
        Thu, 12 Nov 2026 09:32:54 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:2c54:4647:b67e:c94c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae8be5adsm383532a91.0.2026.11.12.09.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:32:54 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH rtw-next v3 0/5] wifi: rtw88: extend 88xxA support
Date: Fri, 13 Nov 2026 01:32:39 +0800
Message-ID: <20261112173246.3201729-1-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
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

This series enables HT STBC transmission, VHT SU beamformed reception
and carrier-frequency-offset correction on supported 88xxA devices.

Tested on RTL8812AU:
TX went from 136.0 to 144.2.
RX went from 215.5 to 249.2.

Changelog v3:
- Remove EDCCA commits since it causes problems in some situations
- Beamformee: gate on spatial streams instead of the RX antennas,
  in case an antenna is disabled
- Beamformee: writes RTL8814A use rtw_write32_mask() instead of
  an unaligned 16-bit write
- Beamformee: drop the chip ID from the debug message, style fixes
- CFO: add RTW_XCAP_MASK to phy.h
- CFO: use 0x20 as the RTL8814A crystal cap when the efuse is empty,
  following the vendor driver
- CFO: add comment on why min(...,2) is needed for rtl8814
- A-MPDU: set BIT(31) of REG_AMPDU_MAX_LENGTH, like the vendor driver
- A-MPDU: limit RTL8821A with IEEE80211_VHT_MAX_AMPDU_64K

Changelog v2:
- Split correcting beamform caps into its own commit
- Adjust EDCCA threshold on scan to avoid high latency

Ho Jie Feng (5):
  wifi: rtw88: 8812a, 8814a: enable STBC for HT transmissions
  wifi: rtw88: 88xxa: receive VHT SU beamformed transmissions
  wifi: rtw88: prepare frequency-offset correction for more chips
  wifi: rtw88: 88xxa: correct carrier-frequency offset
  wifi: rtw88: 8812a, 8821a: respect peer A-MPDU size limits

 drivers/net/wireless/realtek/rtw88/bf.h       |   2 +
 drivers/net/wireless/realtek/rtw88/main.c     |  14 ++-
 drivers/net/wireless/realtek/rtw88/phy.c      | 110 +++++++++++++++++-
 drivers/net/wireless/realtek/rtw88/phy.h      |   5 +
 drivers/net/wireless/realtek/rtw88/reg.h      |   1 +
 drivers/net/wireless/realtek/rtw88/rtw8812a.c |  16 ++-
 drivers/net/wireless/realtek/rtw88/rtw8814a.c |  70 +++++++++--
 drivers/net/wireless/realtek/rtw88/rtw8821a.c |  15 ++-
 drivers/net/wireless/realtek/rtw88/rtw8822c.c | 100 +---------------
 drivers/net/wireless/realtek/rtw88/rtw8822c.h |   3 -
 drivers/net/wireless/realtek/rtw88/rtw88xxa.c | 108 +++++++++++++++--
 drivers/net/wireless/realtek/rtw88/rtw88xxa.h |   3 +
 12 files changed, 324 insertions(+), 123 deletions(-)


base-commit: 61a5eb87b2d9b4d5e353780b781cf691f39ba9e1
-- 
2.53.0

