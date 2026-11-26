Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655453;
	b=HE71iT4zfdj3khohdRnVopfLu3gQdsMxnX3IGfXAIqjzGbhgbmB+jAabw1Ofhyusrp14
	 Aw/V9/jWC0ePd1FiRijO+N6wQbK5udI5xulTP27DSgmxkYOh7SNQ5fn413qOPsIa9grNK
	 SSO8xidyGhWCO073edlVwLplXRTvUSLHSNLbthlDVtW9WmojyavnmUaaGRWVb+nOGBGid
	 OtmoNesLsHg1q5ULGacQKf5df5DJLcx4+67K1NEC9rNl6etZxZ7q/FLQ21p7MWmkbIoXX
	 09JHtecyjNYudehcU1TEVErjX+cerJbf0SYH/rLh7uZOVZ6dlcAcVkGyVrxstGyTtNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Content-Language:To:Cc:From:Subject:
	 Content-Type:Content-Transfer-Encoding;
	bh=CI5zhKvhVeYhJ8KzMa1qCsOVacszMfgXuCmQJ6oAUbM=;
	b=PWlDjKv45YqHyoB/HYPmIBAV/vu6QYDt4F2ifck43XRoNoywcaSL4i8nZIKGrUAPoURQ
	 51OWtNbn+YYo9v9yYB38pyMc84D3gG/cY7Ani2Xe+zEXQ9e+i+MygSgJPuw5/TphJuvRr
	 HuJPX/y8vQK0Ivbm2I7EQsKG13BxZqp00FIz0PIhaY5dKfvxjTqIyuuhyC71LkgO+BllK
	 azcJrHy2CBmcF1yjY6DMDt4RJ1BKG6MK4Q119DJJNM7ONL4mToNsn7zFPTBaoeHENR4cZ
	 jXMqT9TJg2iXtRPehJ0HmvMZM84VaD75IVz8CvpsOktwUdnsT4pn5/c+NoGulMdM/1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=acoCgETl;
	arc=none smtp.remote-ip=74.125.225.139
Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95E6606A333
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 01:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B95E6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=acoCgETl
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-49814d35686so5027885e9.0
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 17:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795655451; x=1796260251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CI5zhKvhVeYhJ8KzMa1qCsOVacszMfgXuCmQJ6oAUbM=;
        b=acoCgETlEHuH9fgIlLBsXNLOAhvloBwmCFSEPLImUKQN5oG/s0mFReeAUiAVeVta5Z
         hkwZq5RnNS9P89lUgcMDrafFOZCM+x2RxlTAJ/GdtcHqzDPn3LDe97NkRNRVIRolfZPC
         npDq9yck1syqrp5sVDBj6IepLMhJOnc8TR/+2ZvgbnFLAJcqtGukv1Z3+xTaAJ1REnx2
         TyjWUPAH14X9KAMtq6Gsdd53+ccLIk16NzImf19rKQCEHWFTcJOrhV1v7lXnFBBM2KoR
         0zhM263SQbl6PQzzkyp5FPO0qJuRI5wjllKPRxnIdG2ZetkG6hZAYrYkPXthCr0NrbC/
         Ydyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795655451; x=1796260251;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CI5zhKvhVeYhJ8KzMa1qCsOVacszMfgXuCmQJ6oAUbM=;
        b=Y7bKQmqPenXVKlodpzQ0pnliaEnLBYSgsb8AdxsGbzxcxFi1+WNMtetdKos2Q88+LV
         6P0Ir5dU3B+eP/RD/xunrJNCwXMPDMp+bUHupWaNlKJkmQ8KKdKEnVhWh40ci1kJM7yr
         JDXyMWiRvqqQ8SsXQcLSlL4VxAXU9PIRImt0PZWpNR70HzrRzFhD7GUTp0LZ115rAu/l
         Kpj61wkHB2K+b23EPeeeqIchml3yBDDnIaCK4FUIffNw+jK1XyTMtsWERCvNopjbEFJR
         YulInjHCUL2loNMkw+NkDw1IqM6hkmRB0x53r+yt6gHHAo7hdV+BFCUS9Fcv36z4Cl5p
         6iAA==
X-Gm-Message-State: APuU4Z8eGLrDNxxfV5yi7q9zL0VYssBRgXhoSNq1ED8dFF+EYqzGG2ot
	qH9In6+ttLXBGvLg1L6dIIFc4H+jEJW6TTJ00i6kcTIA8QOS/QIqI3OR
X-Gm-Gg: AZFdTZdtJZnQjm2nsigP4g2YI8nMNPN+H4LlipYwNe3CJpse5sDAT8q7UjYGNtnKkEv
	dJiYPGXQyvnB+tFFkeSkFquzx0LpTdl/uGnvFOzZVAnLa2S4gbNFDGkJoGPxMF9UH1z6hrdXpKM
	x1lK/6Sy/dj01lqjl9fik4c0ucg0c8xUNzkBRNk2GV7OcbpHulkKgjPR9yS/99M56CjVdpsD88S
	o4eMrIP9BRZ7V0hmPv6NHP0Hw4aYCuvINCXnKN8I48bCMXUPzwlLZEj8ziwsJk11elbgPg5P7gd
	OUz5RoDtbck0XLMHnKKlOnY6YmpkmlrmJEpVRPWG/WrWCQ3p8J6P6j8vdVrvAd6JAZZcR//IdUy
	gpEdx+NWhxplpBaNzzqm4RlGhc4RviL9H7Qgnr0COUrTDj584D4G6fimbNKeU0dfreulj36BrKH
	ybI3JXwKTEZwnl3TMr0Kz7s8No2KGBQTyWdT+7XAkyteONNs13U2EjT3IY9LSd2EMrk8cHi0ip7
	8dFVwy7HaskKCJGkx64N+ZPMaTSzVkgEALKoWrS/SvbzPdqyQAj8Vdly1WROFIuRE+iERzwOt7x
	82MgDh82uvUmi+0LyDba4Tu6LjHqL/cEA+JhSb6R1oEANpiAUCtOfSBlZg==
X-Received: by 2002:a05:600c:5303:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb88807d7cmr370247515e9.9.1795655450984;
        Wed, 25 Nov 2026 17:10:50 -0800 (PST)
Received: from [192.168.1.11] ([31.94.68.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm877678425e9.14.2026.11.25.17.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 17:10:50 -0800 (PST)
Message-ID: <5bbfff95-a4c8-4fe6-a56f-01ac8bf4a473@gmail.com>
Date: Thu, 26 Nov 2026 01:10:48 +0000
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, Hamid Zamani <hzamani.cs91@gmail.com>,
 Kalle Valo <kvalo@kernel.org>, Hector Martin <marcan@marcan.st>,
 Michael Reeves <michael.reeves077@gmail.com>,
 Jason Huang <jason.huang2@infineon.com>,
 Carella Chen <carella.chen@infineon.com>,
 Darren Li <hsin-hung.li@cypress.com>,
 Girish Rudrappa <girishbukkasagara.rudrappa@infineon.com>,
 Daniel Berlin <dberlin@dberlin.org>,
 Johannes Berg <johannes@sipsolutions.net>
From: Richard Lane <richardlanedev@gmail.com>
Subject: [PATCH wireless-next] wifi: brcmfmac: probe VHT80-capable regrev on,
 BCM43602 ISO3166 fallback
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On platforms without a platform/DT country_codes mapping (such as x86
Apple iMac and MacBook Pro systems), brcmf_translate_country_code() falls
back to passing the ISO 3166 alpha2 country code with rev = 0 to the
BCM43602 firmware.

In the BCM43602 firmware shipped by linux-firmware (7.35.177.61, r598657,
PCI 14e4:43ba), rev = 0 enables 80 MHz VHT channels for US, but disables
all 80 MHz channels for European/ETSI country codes such as DE, GB, and
EU. As a result, 802.11ac links in affected regions are capped at 40 MHz
even when both the firmware and AP support 80 MHz.

Probing the firmware's embedded CLM table via the "country" iovar on
7.35.177.61 shows why neither rev = -1, a fixed non-zero rev, nor
selecting the highest accepted rev is safe:

  req     fw      2.4G ch  5G ch  80MHz ch  DFS ch  Notes
  ------  ------  -------  -----  --------  ------  ----------------------
  DE/0    DE/0    13       19     0         15      40 MHz only (current)
  DE/2    DE/2    13       19     16        15      first VHT80 rev
  DE/3    DE/3    13       19     0         15      regresses to 40 MHz
  DE/7    DE/7    13       19     16        15      VHT80
  GB/-1   GB/0    13       19     0         15      40 MHz only
  GB/0    GB/0    13       19     0         15      40 MHz only (current)
  GB/1    GB/1    13       19     0         15      40 MHz only
  GB/2    GB/2    13       19     16        15      first VHT80 rev
  GB/3    GB/3    13       23     20        15      adds 4 UNII-3 ch
  GB/6    GB/6    13       19     16        15      VHT80
  EU/0    EU/0    13       4      0         0       40 MHz only
  EU/13   EU/13   13       16     12        12      first VHT80 rev
  US/0    US/0    11       25     24        16      already VHT80
  US/1,2  US/1,2  14/11    0      0         0       5 GHz disabled
  US/9    US/9    13       25     24        16      opens 2.4G ch 12-13

Keep rev = 0 as the initial request so countries such as US/0 succeed
without extra firmware commands. On BRCM_CC_43602_CHIP_ID without a
platform country_codes table, if rev = 0 leaves a VHT-capable 5 GHz band
with no 80 MHz channels, probe ascending revisions (1..15) for the same
alpha2 and compare per-band channel bitmasks via brcmf_chan_mask() to
select the first revision that:

  1. enables at least one 80 MHz 5 GHz channel,
  2. enables no 2.4 GHz channel disabled under rev = 0, and
  3. disables no 5 GHz channel enabled under rev = 0.

If no revision satisfies these constraints (e.g. E0), restore rev = 0.
cfg80211 continues enforcing Linux wireless-regdb rules on top of the
firmware channel list.

Tested on Apple iMac17,1 (BCM43602/1, 14e4:43ba, firmware 7.35.177.61)
against a 2x2 80 MHz 5 GHz AP on channel 48 (5240 MHz, GB/DE regdom):

  Metric                 Before (rev=0)        After (probed rev=2)
  ---------------------  --------------------  -----------------------
  Channel width          40 MHz (5230 MHz)     80 MHz (5210 MHz)
  5240 MHz iw flags      20MHz HT40-           20MHz HT40- VHT80
  RX / TX PHY bitrate    400.0 / 400.0 MBit/s  866 / 866 MBit/s
  iperf3 TCP TX / RX     325.0 / 315.8 Mbps    635 / 599 Mbps

Fixes: 21947f3a74d6 ("brcmfmac: use ISO3166 country code and 0 rev as fallback on brcmfmac43602 chips")
Signed-off-by: Richard Lane <richardlanedev@gmail.com>
---
 .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 57689026525e..a90a7c1cdad1 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -8442,6 +8442,62 @@ brcmf_cfg80211_dump_survey(struct wiphy *wiphy, struct net_device *ndev,
 	return err;
 }
 
+static u64 brcmf_chan_mask(struct ieee80211_supported_band *band, u32 reject)
+{
+	u64 mask = 0;
+	int i;
+
+	if (!band)
+		return 0;
+
+	for (i = 0; i < band->n_channels && i < 64; i++) {
+		if (!(band->channels[i].flags & reject))
+			mask |= BIT_ULL(i);
+	}
+	return mask;
+}
+
+static void brcmf_probe_vht80_regrev(struct wiphy *wiphy,
+				     struct brcmf_if *ifp,
+				     struct brcmf_cfg80211_info *cfg,
+				     const struct brcmf_fil_country_le *base_cc)
+{
+	struct ieee80211_supported_band *b2 = wiphy->bands[NL80211_BAND_2GHZ];
+	struct ieee80211_supported_band *b5 = wiphy->bands[NL80211_BAND_5GHZ];
+	const u32 no80 = IEEE80211_CHAN_DISABLED | IEEE80211_CHAN_NO_80MHZ;
+	struct brcmf_fil_country_le probe;
+	u64 base_2g, base_5g;
+	bool dirty = false;
+	int rev;
+
+	if (!b5 || !b5->vht_cap.vht_supported || brcmf_chan_mask(b5, no80))
+		return;
+
+	base_2g = brcmf_chan_mask(b2, IEEE80211_CHAN_DISABLED);
+	base_5g = brcmf_chan_mask(b5, IEEE80211_CHAN_DISABLED);
+
+	for (rev = 1; rev <= 15; rev++) {
+		probe = *base_cc;
+		probe.rev = cpu_to_le32(rev);
+		if (brcmf_fil_iovar_data_set(ifp, "country", &probe,
+					     sizeof(probe)))
+			continue;
+
+		dirty = true;
+		brcmf_setup_wiphybands(cfg);
+		if (brcmf_chan_mask(b5, no80) &&
+		    !(brcmf_chan_mask(b2, IEEE80211_CHAN_DISABLED) & ~base_2g) &&
+		    !(base_5g & ~brcmf_chan_mask(b5, IEEE80211_CHAN_DISABLED)))
+			return;
+	}
+
+	if (dirty) {
+		probe = *base_cc;
+		brcmf_fil_iovar_data_set(ifp, "country", &probe, sizeof(probe));
+		brcmf_setup_wiphybands(cfg);
+	}
+}
+
 static void brcmf_cfg80211_reg_notifier(struct wiphy *wiphy,
 					struct regulatory_request *req)
 {
@@ -8483,6 +8539,9 @@ static void brcmf_cfg80211_reg_notifier(struct wiphy *wiphy,
 		return;
 	}
 	brcmf_setup_wiphybands(cfg);
+	if (ifp->drvr->bus_if->chip == BRCM_CC_43602_CHIP_ID &&
+	    !ifp->drvr->settings->country_codes && !ccreq.rev)
+		brcmf_probe_vht80_regrev(wiphy, ifp, cfg, &ccreq);
 }
 
 static void brcmf_free_wiphy(struct wiphy *wiphy)

base-commit: 18d0bedbb5f0538396cb7f763ed9cd1dd69c5b23
-- 
2.55.0
