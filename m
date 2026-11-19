Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107882;
	b=sIB2qi1sHmejt9JEp/r/uKFq78oHhmiqmUxJ40rJs1haGMJM6grptw1KfkUNpvn8vbxs
	 1c70PyidDecUboms1HpW37fMEdjJ54kITzYf21OKi4naqnaHa9Wlr/Ol1g47HyHmlMhjg
	 RZWlTXP6RDFLD3NMbgPIKTK4vW9ODenkdt+7G45lR+NxpDKwcviR2iuqDqovdpP2yFTlj
	 Wwk2pL5lmihYeCjIXbqvnllcsRqIU9zj5SnYdGH5D1iIhiz2zQPbhgSnrB3c9xAc8DPiw
	 M68cSocYr7UVT+jXNvZAYG6aQHsF/DHOvpFnlfWB0sGfF28Q16su1suZAQol6+jHK4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=nOpfnyLydw75pNNoS2jndLIyVUsH8pHMIY6wExaOazs=;
	b=hb/1l+rO3HxSCJcwApk2e2O7MbDNcsURgiSCg90F2uo8XTujbGQfP+eP7KnhLeLre64Z
	 ntN+SwJeeMRFxXMlMWwpheArmGNHlga3GDFFkl2/rBJBj5Uu2p6hAKFY9maGskF1ezSoZ
	 dcVHOQJeI7B04tyJDBAhrEbErmAU0QaSVDDqJu3Jt54eMO8NOMkVl4FdoSPXGw48TvnYF
	 Aei9r9IIC7ypABOD+TtB5zePSZ01uwmhhIPSbtPhtvEh3tW1thqAcNsOd6C5TNN21/t0x
	 EWA2/tjkBJd0jE3QfwqyuPwCZuk5fj/cfvNGfyTk5qFPiqv5/FtqrrGyUnclmCzoiIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=flBkUQDJ;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B33606A325
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 17:04:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4B33606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=flBkUQDJ
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3ae17c536so2287813c88.0
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 09:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107881; x=1795712681; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nOpfnyLydw75pNNoS2jndLIyVUsH8pHMIY6wExaOazs=;
        b=flBkUQDJOC3iYGTXsEUtJ75OQ+9dDEj/P1WWS5cvQKALKVhJOS50dXWjd0IKwvsVZv
         mmqyg8o0z/4VkKJMTW2LmIe1h8jOUZQokc4IO4gOrtR1CG0FmWxyz2kC3WBz0uPzPu7x
         QQVSMGiQBVQWSbQMElagvXQWzzIKdzgVZzPoENeMa5IfZ0HY34k/6pqvZ/glZr7F7XGk
         vuLzxiYea+k+ftYMO8BMRyE7ohay4/vwaVhTDy2uhBbKljTX7RfTdcQjxlL0T5HP2Hq+
         nlA6zmHehphQvAWSm3XDBcspR91kG9g2MnQm6m4SXdT2FrC2XJ76ug7VKsoVIbgovHVW
         UySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107881; x=1795712681;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOpfnyLydw75pNNoS2jndLIyVUsH8pHMIY6wExaOazs=;
        b=ad2djOC9tRaIdm2ZibgER29arkpS48erDKs3czRUfQe7IlV75l7M9U5yqD6A50v93R
         RxRDFX4GcP8EUNiPWCuRHyPXApism+Mm4TM80JVVxLfGzzxu7nxYpUkNWi2WgwWgNb9E
         efupEdGXrAthv0X4qGTPqfN/arMInKj9kscfrLlATCX3MepdnyaMRkvXfVuE1/4dCc8m
         4PhYD/e/hSnWN7ZyYuftwHdQCouZL9z7jEwLH/FUHhnQR0c+t5M3/MqCBVQNGUtagQXo
         krztzKA4uavfaKr4PzsfQa3c2uGY9MimFf+wI3OVNALmWx+poqa2Aq+zltHdcUwu5Nms
         0iTg==
X-Gm-Message-State: APuU4Z8vfp/pvwfUBb9F3yRDK+5SnQi9QHMv5Akk3cRcJlxP6N3WDlgx
	H2QuEW39ZDBlVx2jsW11EYLcdXgTKkMfNaZTV8/fFkxbFa4zvkvHV3PBL8ahi7d0bRM0d6/xi1M
	4SyY83+mT6g==
X-Received: from dlbur6-n1.prod.google.com ([2002:a05:7022:ea46:10b0:196:1ea7:17b6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4502:20b0:152:9e88:daaa
 with SMTP id a92af1059eb24-1b55690040amr238241c88.36.1795107880543; Thu, 19
 Nov 2026 09:04:40 -0800 (PST)
Date: Thu, 19 Nov 2026 09:04:37 -0800
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170437.1512945-1-irogers@google.com>
Subject: [PATCH] wifi: b43: Use 32-bit signed integers for N-PHY RX IQ
 compensation math
From: Ian Rogers <irogers@google.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, b43-dev@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In b43_nphy_calc_rx_iq_comp(), the intermediate variables tmp, a, and b
are declared as u16, even though the fixed-point calibration arithmetic
shifts 32-bit IQ correlation and power estimates up to bit 30 before
dividing:

  a = -((iq << (30 - iq_nbits)) + (ii >> (1 + arsh)));
  tmp = ii >> arsh;
  a /= tmp;
  ...
  b = (qq << (31 - qq_nbits));
  tmp = ii >> brsh;
  b = int_sqrt(b / tmp - a * a) - (1 << 10);

Truncating these 30/31-bit numerators and ~20-bit denominators to u16
discards their upper bits (frequently collapsing b = qq << (31 -
qq_nbits) to 0 and corrupting the signed division a /= tmp), producing
bogus 10-bit RX IQ calibration coefficients compared to the 32-bit int
implementation in lpphy_calc_rx_iq_comp().

Change tmp, a, and b to s32 so the fixed-point divisions and square-root
input retain full 32-bit signed precision.

Found by enabling Clang's -Wimplicit-int-conversion-on-negation on an
x86_64 allyesconfig build, with AI coding assistant help to audit the
warning and prepare the fix. Verified with a standalone C fixed-point
test and Clang build; not runtime-tested on Broadcom 802.11n hardware.

Fixes: 34a56f2cae86 ("b43: N-PHY: implement calculating RX IQ comp")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/net/wireless/broadcom/b43/phy_n.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/b43/phy_n.c b/drivers/net/wireless/broadcom/b43/phy_n.c
index 007940f3996e..7b020e0fcd93 100644
--- a/drivers/net/wireless/broadcom/b43/phy_n.c
+++ b/drivers/net/wireless/broadcom/b43/phy_n.c
@@ -4482,7 +4482,7 @@ static void b43_nphy_calc_rx_iq_comp(struct b43_wldev *dev, u8 mask)
 	u32 qq;
 	int iq_nbits, qq_nbits;
 	int arsh, brsh;
-	u16 tmp, a, b;
+	s32 tmp, a, b;
 
 	struct nphy_iq_est est;
 	struct b43_phy_n_iq_comp old;
-- 
2.56.1.708.g77570a6a1d-goog

