Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506205;
	b=dmhohHqeOq5lF818xJQaMcXvBbjEEUT04Us3Axx7GP4sSMv5UhPdyIIIoVCMUKxbdNMw
	 cb8AL01/i2wa/GuHZIfzK8AswtwVe4BsS4UeawMGpNiKimedC+sHiZVVHUDEtql0iFV4G
	 6Pz/NJ3FCVFoMYZP6PWYOwBZbNAVeMSYhBLs/u7weJuKqubJehU9Autt8zyDthcrjXGxB
	 Uov9FvhnOdLPSTg++/oHTa305O9Dajw2eNfdLMx5tOs2Z2II2S4n7BEqOCDJlUQXQrH6K
	 r49KoY9tfMHJ98WnYcdXp67CfqKSLQyrpJldTF53UxJlVBImMmWQzrveFETZXjLQiXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bVukesRVZXuCwNfxWw9b9XoFHDuzUlJG4NqmqHbHpsU=;
	b=M9nsQ0a7LxZ1D/RDuwFQJXf9WI95kFaQvvLL/dKbA+ifnqDmRwTFRiO1FT5jkeNXtglR
	 GUh9n+nw1UbvP4DyzrwKvJK/pWUolMHEE04iQHvVYvYfWDZkfHFzZAIRo3Mcwx9cnZAeF
	 REr4vIzgvGYUBMV8cRkqJHNaUy+YhcdImFza88y3mT9vrSRJhhp2SAv6f+Qi3Nfdz4vHq
	 SnclwsNGlzBFOOavwTW6OtJLNJGIvzzCX3xilsrYR4v1TyMFU1AojfMNGp3DINcjDkTC5
	 0rpF2/Ok6dh9uUy+GR562y6vaR1Y4+fIdALQSr6kkLNUzCrRRiJhYYlCd8EoyhLitgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DNhznkaJ;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC59606A88C
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 17:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FC59606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DNhznkaJ
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so33289f8f.1
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 09:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794506203; x=1795111003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bVukesRVZXuCwNfxWw9b9XoFHDuzUlJG4NqmqHbHpsU=;
        b=DNhznkaJ7zNMnvcw6AjzPAyKEmfn/mVFmumdzGHftPMpKwHVvLxpVCKemf74ZwriZA
         rE8U6eTNtP7H+eVD3LrBRY7+v78iRu+kQImaWQLDUZNnV2kdiL6FNb7J8eak2szh9BLH
         iTsdq00Ndt1GsmGIA8K2QcTz/QUj8mrrS8koLwMpROTv1rCMCctahmy13WERe8AgV59Z
         98xN+vGkU2sDL6YcjxRvmK/v4z7enJXgcyIREhdndSAPb5/McZdSquMKFHkD7SVwsSUu
         Ugg8UIzoNGGaWGB2mcgrBlRV7Y3kdSPUCwhPbT1weyclnFidqgVHHMSv+81V6Zy9Vo+p
         nKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506203; x=1795111003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bVukesRVZXuCwNfxWw9b9XoFHDuzUlJG4NqmqHbHpsU=;
        b=bcX4KX7LHPpwm/drudSbnKbRmU5BDWkgCFBRjYf2YeFsSSgEmRNFJUs9dGPBPt3PH/
         P8ME24UMoPWCSJ77R6b4jerCkbywb90qY2xB67RkLp4QHyUvAhlJGF9dx628MQIuCemQ
         QuprdXIFspOyovh1qHNdeSewVXU2ZdULzSKo/5cfHD7vLSnsGxPq6gKcGC7IRjDJGWVT
         ADlVMkDmTN/CZxZ3DJw2jKCpAEluCDVffZfDFW2qaKnhgvd82r2ZfgIZv6S2zRPXhuTP
         0SarCKy9em3eXOnfltRWkQCaKKoSHjkmU2Q1MK0MiR+pKI01E2vLmauLruz86gJ+l2kN
         tAeA==
X-Gm-Message-State: APuU4Z/Dbr4PR07UBOQmXunUbkOUUchMP6e3x4a+OfVJ7eRis9hCsEFo
	XfqPp7J0PkJNr19xEx1XyE69bMlyHdZ6U/k6nz0G0dC3/nYAL+Fs1E76gIr25e8r8Sc=
X-Gm-Gg: AYBFou1jQY1T+Z/cc0KBFNkrlh14UZD4SvJxOuI8afNADxE1NEdDIDghM2l0sPJ8FE9
	BLqVbnzSHeteDvRQ+D73atgsV0CUPk5AwPHJzIOokLbd/EMb0+MIaQXNzCfyqm0o8lP/x3sTZJS
	CC3PlDYlwrsjrO8jIiqi4TDmBfmL9ISymHbdGSX6ryCVQAU75kpfvrhZfiL8L5IJUxvHx0p4x3G
	CUxeXfXAvLv34Gvj1ES/SlNEsM3I1dMm2VDp9CmsWPmTvveQejyXgZQWAAae7V4Hn2Cqe5vd2Oj
	xxUVaViJQa8ZBu+n9dOIgM6EIPtXh9n8oWENPG2QDoVM5AAKV+8d0u5zr0zUwYLs7utdcCU/RMr
	Kls8yFv9TWGKJ6r2nKF8TLEW3ssaZGGDaVRoVInNNVxQ05B3DzXETLqLpWkBnSbInadJMt+VZKs
	NXRMafPf+HjHPdc9jd+lAFV1TfF2llQzv4vC3ui/nhDSRwjnRlY0ebIEeq/vX2raffMukyUWCD4
	HpOTHkx7QR5IlUHUG6qtrCL10zmhzTl9QrH4dEKBwqXOb0V91xCAIytsAagbYC7CeJqf4QLMbw4
	3Fo4A//OUVIc9OAUKfXsOj0dIVSfZ7UqRAj8DQp56mPgxn6OFXlfTmWmG6jMpc+LQvQX3IXtSyK
	meQb3OxsN2Ph21WL9z723ujF2mc+3zuSj7BojG0j0A9Hxzb0DUqt0Oqcq3PdBEFZm56pphNFhby
	mC+lO60qwqysNdz3kkHPFMXPze6YXj0e9Ei2aXtiVYzxY/kJMe90VcU+0PDSBJx9I=
X-Received: by 2002:a05:6000:2411:b0:48d:df08:307c with SMTP id ffacd0b85a97d-49c726da6a6mr271994f8f.44.1794506203353;
        Thu, 12 Nov 2026 09:56:43 -0800 (PST)
Received: from zitrone.tail45b538.ts.net ([2a02:810d:a1:6000:900:be5c:7a9c:c176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c193fsm547430f8f.13.2026.11.12.09.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:56:42 -0800 (PST)
From: Andreas Wendleder <gonsolo@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	b43-dev@lists.infradead.org,
	Michael Buesch <m@bues.ch>,
	Alessio Ferri <alessio.ferri@mythread.it>,
	kvalo@kernel.org,
	julian.calaby@gmail.com,
	jpeisach@ubuntu.com,
	rosenp@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC wireless-next 1/4] wifi: b43: 11ac chanspec for the AC microcode
Date: Thu, 12 Nov 2026 18:56:37 +0100
Message-ID: <20261112175640.40603-2-gonsolo@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112175640.40603-1-gonsolo@gmail.com>
References: <20261112175640.40603-1-gonsolo@gmail.com>
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

The AC microcode keeps an 11ac chanspec of the current channel in SHM
(where older microcode keeps the channel cookie) and takes one in every
TX descriptor and puts one in every RX header: the channel, 0x1000 for
20 MHz and 0xc000 on 5 GHz.

Add b43_ac_chanspec() and use it for the channel cookie in
b43_switch_channel(). The TX and RX header patches that follow use it too.
Signed-off-by: Andreas Wendleder <gonsolo@gmail.com>
---
 drivers/net/wireless/broadcom/b43/phy_common.c | 13 +++++++++++++
 drivers/net/wireless/broadcom/b43/phy_common.h |  7 +++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/net/wireless/broadcom/b43/phy_common.c b/drivers/net/wireless/broadcom/b43/phy_common.c
index 285490f..cfc14c1 100644
--- a/drivers/net/wireless/broadcom/b43/phy_common.c
+++ b/drivers/net/wireless/broadcom/b43/phy_common.c
@@ -413,6 +413,17 @@ void b43_phy_take_out_of_reset(struct b43_wldev *dev)
 	}
 }
 
+/*
+ * The 11ac chanspec of a primary channel as the AC microcode takes it in
+ * SHM and in the TX and RX headers: channel, 0x1000 for 20 MHz, 0xc000 on
+ * 5 GHz.
+ */
+u16 b43_ac_chanspec(struct b43_wldev *dev, unsigned int channel)
+{
+	return channel | 0x1000 |
+	       (b43_current_band(dev->wl) == NL80211_BAND_5GHZ ? 0xc000 : 0);
+}
+
 int b43_switch_channel(struct b43_wldev *dev, unsigned int new_channel)
 {
 	struct b43_phy *phy = &(dev->phy);
@@ -428,6 +439,8 @@ int b43_switch_channel(struct b43_wldev *dev, unsigned int new_channel)
 	/* FIXME: set 40Mhz flag if required */
 	if (0)
 		channelcookie |= B43_SHM_SH_CHAN_40MHZ;
+	if (b43_ucode_is_ac(dev))
+		channelcookie = b43_ac_chanspec(dev, new_channel);
 	savedcookie = b43_shm_read16(dev, B43_SHM_SHARED, B43_SHM_SH_CHAN);
 	b43_shm_write16(dev, B43_SHM_SHARED, B43_SHM_SH_CHAN, channelcookie);
 
diff --git a/drivers/net/wireless/broadcom/b43/phy_common.h b/drivers/net/wireless/broadcom/b43/phy_common.h
index 5ec5233..c20a20e 100644
--- a/drivers/net/wireless/broadcom/b43/phy_common.h
+++ b/drivers/net/wireless/broadcom/b43/phy_common.h
@@ -390,6 +390,13 @@ void b43_phy_take_out_of_reset(struct b43_wldev *dev);
  */
 int b43_switch_channel(struct b43_wldev *dev, unsigned int new_channel);
 
+/*
+ * 11ac chanspec of the AC microcode, and the centre channel of the 80 MHz block
+ * of a 5 GHz primary (0: none)
+ */
+u16 b43_ac_chanspec(struct b43_wldev *dev, unsigned int channel);
+unsigned int b43_ac_80mhz_centre(unsigned int channel);
+
 /**
  * b43_software_rfkill - Turn the radio ON or OFF in software.
  */
