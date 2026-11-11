Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794394430;
	b=P+geZFf86I2YJKct9/q6fKqnuQHMfzCDzMUt8vuz9DZIvKyHAOH3eNRmYHDIMI7hzE6S
	 f+nbmNPrDaMDvMDU1dHvL0RXg5NvWr28PsNfgENRBemGf/Ya5mL5v4tEgIjLgPvFuIQ5Y
	 AWaVIe9MuCgEgFL/YxMTmUkUyC9W1DsL6MzLXqEbEuhVGRyqGxkQsQiWPbrE1gjE0WklL
	 AkEZwhtXNJWBTctcLsYcxNbji6UzLByA3Ei/afn8clUghliZbDAdqQw1JeR3n1hddvQch
	 ofBJSyYhK0LYw3WvDEir1Kn4eQaU9Ba7Bmd/ONnh+kuSbyCGf8Q7K5QvhnuzgHYUTDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794394430;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LrCsVDLDTIAp1Xidd7UPyqGE5geG7h6lCwb6DRd1iuY=;
	b=Ztv4yW411UQYan1+WLj/aZp2EzfShu6hgghYKFhIEif5SotFVq5WQjHh2cqCNeEYFB/M
	 H9UgtJB+oimQA3U7UA8TfExs4dSTCRXh3/+dosvW/OrXaQgjHohs3htvYdKmsGD+RBQZn
	 FqMXfAQalCoWmcAZzx5ZyQK+0L+zwJlFDK9p6e8Rgsjmv4cnb4Z+gNdjHBH32E6pQmD8q
	 F4y+z7olxxMv3pE1nsOiQAegPQK/53fhSE4Zw9H6EXfh8IJdpkeFN+budlt3Xb8hPaVrx
	 ZK1VpMN4e1Zh3SjtK1j87wzaw8BRYwbZ9G5oeiOoVAmkDQ8b/DZlG0r9cg0UBX8WgsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yn64J3VD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Er4SCk/C";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D1C606A321
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 10:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49D1C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yn64J3VD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Er4SCk/C
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB7DW281590236
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 10:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LrCsVDLDTIAp1Xidd7UPyqGE5geG7h6lCwb
	6DRd1iuY=; b=Yn64J3VDBsIj8jpOwzN3gJoldspdwPdE6E7ddn+SkI0ygRLXdAy
	B/Ab1sZoSYmnukXN1Vk/wMzusAi5duEr+4xIqQx8avox5cvwZiK6IHFLNz/Vm8Ek
	Hjwfak9eSF+/XE1baDKo2mHwKgKBOpQFvzwRccSwlHD42lcTStBKmlvoL6fHCpxQ
	h9lRnQGKGM0GaGzobgb1dVmJS+Heko57kj3ILH/DbC7WipGZSLyXmTKge9cQoxDN
	Cl1Rlde8o/x+ywDp919kzPW17l9dclasNKXupyL2YyIC+yNfqX0T7RhEQkyDIhiL
	IYimLL/lCFgmNQ2x9g8gVUGIbdYPuDXgLkw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksm8uct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 10:53:49 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36efb506f29so5199531eec.1
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 02:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794394429; x=1794999229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LrCsVDLDTIAp1Xidd7UPyqGE5geG7h6lCwb6DRd1iuY=;
        b=Er4SCk/CxL4CYGleIb2U6ACxQGUHaErBJRJy5Pg7tyO3FTmyjMatYbVu0pwuh7tDny
         GZAL4AwIy+JuqM0oHjxIAt5PdDgYqhgk2Mc7D8PNLHpIITIluiFV/9aiG7vBkh/tlC4d
         xQ4XN/GQhKn/IdGF4RWuJquTVvR5lHMx/o4QwmghSq98VJK1xJ9mLwx5VZwEe814ofm9
         lzqa5jeMbmk2TCnywbQJKAEnt+sGHXA6nJNSXc3nsZZTUGKpJ5ni0w/SKjLj+q4dSjtt
         tQS674dU7gUKL/+oTkoVOyPNuBY9LoHUt8b+87sLCMutCOAWIOUDmB0ZH7E3klfST9Yn
         73eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794394429; x=1794999229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrCsVDLDTIAp1Xidd7UPyqGE5geG7h6lCwb6DRd1iuY=;
        b=EjHdHLIQqZ/0bzWMszmh9R05Z1mdayeAUEKxU3jFhxCEySrgaslbO1v+7139eNn+Co
         5kvHDzB8C4JYxIV6uaxxM5gcIgwDB8VzcPRnueSfy15yY0QCybC9emzC5XEPkK+XRmCq
         U/1FI+cY4JSxClSR8BsWAi3TOrc5CiWPwMboOGxRVe7TZp+V6jXfQI0u9hfuCPU7Zo2c
         4IRsG7vNKiehF3XGP/MtdOUzeSdSEgKw4+Pve8NDKwO4R/O7kq2XTworRiYAtlRyISdg
         DIxJxXk42YNQqvoAb9V6MYWoqT9Wl+l5dUnOVAXrwivGVgcV5R3l5PR9rL9SVPZdRB6p
         D5FA==
X-Gm-Message-State: APuU4Z9u8xseFPZAuOs6Og2F0n5q+6xZiJop8QGl1fEexsBbgAzKpgFR
	E7KdeQJb8HZSd2VPrinE1jHZfx/klHGnBXJ897Hgd3erAlRr808aQnSYvoTakydHMvnAj7lCTvX
	eDySYLeqELPvTwRRcvfIkcD4KHBK2URRwAZeYvrpafWQuS4xaxhC0RFC68o43bBlqmnRkRQ==
X-Gm-Gg: AYBFou2hJvYaqmzJtQtOhiyB8eF4w3fwDTwK1bb86ZC9M2PJoDi/SzDAN7GUdVp6Fh4
	GtMeKUz7AVwQIpJ//Bv2xhzhIKflYI3uLXRYKl09NkkmZ4xsuw1zKMXksAkeElp9/vArkxpjBgB
	v+A79lE8I9yK6ow3OMpS41zK7OqQxtY15O+Zzu8gPHKc8L3w9HfY+mSmYIn1HUYDE6nLkigfdng
	Z+yL3ytHq8eLLBHcAG997UIqLilVrWREiZkGzfXCFaHkU6fkRkweAgo43lahFxb7enqIfHAhRjP
	6i3kccdMQVkg+imsW19Bei/hy7uK3Je4ZTUmZlOd16hzJAd5mSh8OfnHLL5heSX/ze2JkDxjwz2
	Zg4j+qFezFvTNJHDM8BKPh/zTWDZzCvXmB1Jze6KXC3Oot4Iqocfogkfuy/GdhLvpurcPXTClkr
	1V2dxsd2McpwpAcDI/56wFateR8HWq4aATAa73gcErWjBPcas9j7KaJp8AlndmxA==
X-Received: by 2002:a05:693c:8814:20b0:376:2ca2:d80e with SMTP id 5a478bee46e88-37686d343famr2598311eec.30.1794394428239;
        Wed, 11 Nov 2026 02:53:48 -0800 (PST)
X-Received: by 2002:a05:693c:8814:20b0:376:2ca2:d80e with SMTP id 5a478bee46e88-37686d343famr2598288eec.30.1794394427335;
        Wed, 11 Nov 2026 02:53:47 -0800 (PST)
Received: from hu-aisr-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bf3e18sm29300740eec.16.2026.11.11.02.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:53:46 -0800 (PST)
From: Aishwarya R <aishwarya.r@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Aishwarya R <aishwarya.r@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: protect DP peer key cache with RCU
Date: Wed, 11 Nov 2026 16:23:40 +0530
Message-Id: <20261111105340.2087766-1-aishwarya.r@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-GUID: ibcEYjkw5G1WrgRLn84PvDRQBpaasbVc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0MyBTYWx0ZWRfXxs04qvjrnvNc
 XESvsUDyXATP/LyUFo8pXqqAGYCdFOwA4nevFvVLx9iXqG5nZWbQIBw8ac+GDUXdzp2OYMIZG54
 d3C42pV3SbJu+WkNKsQb+Uodjgt7+jdk+kgR68UpffmpYLMLfY9Y6Y4w98fJXwWhKZfnlFM2HTI
 mBmdHVbHOVY972409MPWi5DGL8QzmFj/oVA3eC/iLApAmxE0iH78W6BQKzdx3dqh6ui3MdBuE5d
 we/+Aath6xMMxRAsCz0X87gOYwumB2+F5kj9LMchd0XQEIMFpiPyFQgY4wCdYCBWFRb/IGKloPg
 npeSiOw1kgyfUJ7acFh2o0ZIHvOWiDMhiNi0PaANm4DW9blLSDEpi2rBcEjzkH6iaSODsyOuCgE
 wjKvjBBt6O7cZQLXk58POfpGuiSP+HZ9AuAeqa4JhxFl1K8bCcmE5aK7Esv4EiZ0rd/cYFCB3DK
 7v/Kco6WPaZ9sPtpi9Q==
X-Proofpoint-ORIG-GUID: ibcEYjkw5G1WrgRLn84PvDRQBpaasbVc
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af4493d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=7vOX30R0kcpPTSyLrsoA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0MyBTYWx0ZWRfX1fWkwD/4+VSL
 xaqstcUd7HsYAttnWqhWANn8fLEYxsBItI89OW5ZwkiwYfJZhAaiYwezd0I/RgcxaZzRnND1V4y
 VKIX6gzawowr0OJdEJWKKgc5QN6Yw5k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110043

dp_peer->keys[] caches ieee80211_key_conf pointers for use in the
data path. These pointers are updated by ath12k_mac_set_key() and
ath12k_mac_clear_peer_keys(), while RX and TX processing access them
concurrently.

RX processing dereferences cached keys during TKIP MIC verification,
and TX processing uses the cached multicast key to determine the cipher
type for transmitted frames. The existing peer lookup locking only
protects retrieval of dp_peer and provides no synchronization for
subsequent accesses to dp_peer->keys[].

This creates a potential use-after-free window. During key replacement
or removal, RX or TX processing may continue using a cached
ieee80211_key_conf pointer concurrently with the cache update,
resulting in the dereference of a stale pointer.

Protect dp_peer->keys[] with RCU. Use rcu_assign_pointer() when
publishing or removing cached key entries and use rcu_dereference()
when accessing them from RX and TX paths. This provides proper
synchronization between readers and updaters of the cached key
references.

Also remove the cached sec_type and sec_type_grp fields from dp_peer.
These fields duplicate information already available through the cached
key configuration and may become inconsistent with dp_peer->keys[].
Derive the encryption type directly from the key configuration so that
the cached key entry remains the single source of truth.

Move cache invalidation to sta_pre_rcu_remove(), which fires before the
RCU grace period in station teardown, ensuring no stale pointer remains
visible to the data path when mac80211 frees the keys in
__sta_info_destroy_part2().

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_peer.c     |  53 ++++-
 drivers/net/wireless/ath/ath12k/dp_peer.h     |  11 +-
 drivers/net/wireless/ath/ath12k/mac.c         | 192 ++++++++----------
 drivers/net/wireless/ath/ath12k/mac.h         |   3 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c |  23 ++-
 drivers/net/wireless/ath/ath12k/wifi7/hw.c    |   7 +-
 drivers/net/wireless/ath/ath12k/wmi.h         |   5 +-
 7 files changed, 171 insertions(+), 123 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index 100b398cf868..32d2c9d0a38a 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -331,6 +331,55 @@ struct ath12k_dp_peer *ath12k_dp_peer_find_by_addr(struct ath12k_dp_hw *dp_hw, u
 }
 EXPORT_SYMBOL(ath12k_dp_peer_find_by_addr);
 
+int ath12k_dp_peer_set_key_config(struct ath12k_dp_hw *dp_hw,
+				  const u8 *peer_addr,
+				  enum set_key_cmd cmd,
+				  struct ieee80211_key_conf *key,
+				  struct ieee80211_sta *sta)
+{
+	struct ath12k_dp_peer *dp_peer;
+
+	guard(spinlock_bh)(&dp_hw->peer_lock);
+
+	if (sta)
+		dp_peer = ath12k_dp_peer_find_by_addr_and_sta(dp_hw, (u8 *)peer_addr,
+							      sta);
+	else
+		dp_peer = ath12k_dp_peer_find_by_addr(dp_hw, (u8 *)peer_addr);
+
+	if (!dp_peer) {
+		/* No peer means no key to disable. */
+		if (cmd == DISABLE_KEY)
+			return 0;
+
+		return -ENOENT;
+	}
+
+	switch (cmd) {
+	case SET_KEY:
+		rcu_assign_pointer(dp_peer->keys[key->keyidx], key);
+		if (key->flags & IEEE80211_KEY_FLAG_PAIRWISE)
+			WRITE_ONCE(dp_peer->ucast_keyidx, key->keyidx);
+		else
+			WRITE_ONCE(dp_peer->mcast_keyidx, key->keyidx);
+		return 0;
+	case DISABLE_KEY:
+		rcu_assign_pointer(dp_peer->keys[key->keyidx], NULL);
+		if (key->flags & IEEE80211_KEY_FLAG_PAIRWISE) {
+			if (READ_ONCE(dp_peer->ucast_keyidx) == key->keyidx)
+				WRITE_ONCE(dp_peer->ucast_keyidx,
+					   WMI_INVALID_KEY_INDEX);
+		} else {
+			if (READ_ONCE(dp_peer->mcast_keyidx) == key->keyidx)
+				WRITE_ONCE(dp_peer->mcast_keyidx,
+					   WMI_INVALID_KEY_INDEX);
+		}
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
 struct ath12k_dp_peer *ath12k_dp_peer_find_by_addr_and_sta(struct ath12k_dp_hw *dp_hw,
 							   u8 *addr,
 							   struct ieee80211_sta *sta)
@@ -455,8 +504,8 @@ int ath12k_dp_peer_create(struct ath12k_dp_hw *dp_hw, u8 *addr,
 	dp_peer->peer_id = params->is_mlo ? params->peer_id : ATH12K_DP_PEER_ID_INVALID;
 	dp_peer->ucast_ra_only = params->ucast_ra_only;
 
-	dp_peer->sec_type = HAL_ENCRYPT_TYPE_OPEN;
-	dp_peer->sec_type_grp = HAL_ENCRYPT_TYPE_OPEN;
+	dp_peer->ucast_keyidx = WMI_INVALID_KEY_INDEX;
+	dp_peer->mcast_keyidx = WMI_INVALID_KEY_INDEX;
 
 	spin_lock_bh(&dp_hw->peer_lock);
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.h b/drivers/net/wireless/ath/ath12k/dp_peer.h
index d01ef1aea48b..37f18300ea26 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.h
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.h
@@ -133,11 +133,8 @@ struct ath12k_dp_peer {
 
 	u8 hw_links[ATH12K_GROUP_MAX_RADIO];
 
-	u16 sec_type_grp;
-	u16 sec_type;
-
 	/* Info used in MMIC verification of * RX fragments */
-	struct ieee80211_key_conf *keys[WMI_MAX_KEY_INDEX + 1];
+	struct ieee80211_key_conf __rcu *keys[WMI_MAX_KEY_INDEX + 1];
 	unsigned long link_peers_map;
 	struct ath12k_dp_link_peer __rcu *link_peers[ATH12K_NUM_MAX_LINKS];
 	struct ath12k_reoq_buf reoq_bufs[IEEE80211_NUM_TIDS + 1];
@@ -192,4 +189,10 @@ ath12k_dp_link_peer_get_sta(const struct ath12k_dp_link_peer *link_peer)
 	return link_peer && link_peer->dp_peer ?
 		link_peer->dp_peer->sta : NULL;
 }
+
+int ath12k_dp_peer_set_key_config(struct ath12k_dp_hw *dp_hw,
+				  const u8 *peer_addr,
+				  enum set_key_cmd cmd,
+				  struct ieee80211_key_conf *key,
+				  struct ieee80211_sta *sta);
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4f16c78b52a8..7b9fc75dd1aa 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -6034,55 +6034,32 @@ static int ath12k_install_key(struct ath12k_link_vif *arvif,
 	return ret;
 }
 
-static int ath12k_clear_peer_keys(struct ath12k_link_vif *arvif,
-				  const u8 *addr)
+static int ath12k_mac_clear_peer_keys(struct ath12k_link_vif *arvif,
+				      struct ieee80211_sta *sta)
 {
 	struct ath12k *ar = arvif->ar;
-	struct ath12k_base *ab = ar->ab;
-	struct ath12k_dp_link_peer *peer;
-	int first_errno = 0;
-	int ret;
-	int i, len;
-	u32 flags = 0;
-	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
-	struct ieee80211_key_conf *keys[WMI_MAX_KEY_INDEX + 1] = {};
+	struct ath12k_dp_hw *dp_hw = &ar->ah->dp_hw;
+	struct ath12k_dp_peer *dp_peer;
+	int i;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
-	spin_lock_bh(&dp->dp_lock);
-	peer = ath12k_dp_link_peer_find_by_vdev_and_addr(dp, arvif->vdev_id, addr);
-	if (!peer || !peer->dp_peer) {
-		spin_unlock_bh(&dp->dp_lock);
+	spin_lock_bh(&dp_hw->peer_lock);
+	dp_peer = ath12k_dp_peer_find_by_addr_and_sta(dp_hw,
+						      (u8 *)sta->addr, sta);
+	if (!dp_peer) {
+		spin_unlock_bh(&dp_hw->peer_lock);
 		return -ENOENT;
 	}
 
-	len = ARRAY_SIZE(peer->dp_peer->keys);
-	for (i = 0; i < len; i++) {
-		if (!peer->dp_peer->keys[i])
-			continue;
-
-		keys[i] = peer->dp_peer->keys[i];
-		peer->dp_peer->keys[i] = NULL;
-	}
-
-	spin_unlock_bh(&dp->dp_lock);
-
-	for (i = 0; i < len; i++) {
-		if (!keys[i])
-			continue;
-
-		/* key flags are not required to delete the key */
-		ret = ath12k_install_key(arvif, keys[i],
-					 DISABLE_KEY, addr, flags);
-		if (ret < 0 && first_errno == 0)
-			first_errno = ret;
+	for (i = 0; i < ARRAY_SIZE(dp_peer->keys); i++)
+		rcu_assign_pointer(dp_peer->keys[i], NULL);
 
-		if (ret < 0)
-			ath12k_warn(ab, "failed to remove peer key %d: %d\n",
-				    i, ret);
-	}
+	WRITE_ONCE(dp_peer->ucast_keyidx, WMI_INVALID_KEY_INDEX);
+	WRITE_ONCE(dp_peer->mcast_keyidx, WMI_INVALID_KEY_INDEX);
+	spin_unlock_bh(&dp_hw->peer_lock);
 
-	return first_errno;
+	return 0;
 }
 
 static int ath12k_mac_set_key(struct ath12k *ar, enum set_key_cmd cmd,
@@ -6092,12 +6069,12 @@ static int ath12k_mac_set_key(struct ath12k *ar, enum set_key_cmd cmd,
 {
 	struct ieee80211_sta *sta = NULL;
 	struct ath12k_base *ab = ar->ab;
-	struct ath12k_dp_link_peer *peer;
 	struct ath12k_sta *ahsta;
+	const u8 *dp_peer_addr;
 	const u8 *peer_addr;
+	struct ath12k_dp_peer *dp_peer;
 	int ret;
 	u32 flags = 0;
-	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
@@ -6107,41 +6084,46 @@ static int ath12k_mac_set_key(struct ath12k *ar, enum set_key_cmd cmd,
 	if (test_bit(ATH12K_FLAG_HW_CRYPTO_DISABLED, &ab->dev_flags))
 		return 1;
 
-	if (sta)
+	if (sta) {
 		peer_addr = arsta->addr;
-	else
+		dp_peer_addr = sta->addr;
+	} else {
 		peer_addr = arvif->bssid;
+		/*
+		 * For STA vifs the dp_peer is indexed by the AP MLD address
+		 * (vif->cfg.ap_addr), not the per-link BSSID in arvif->bssid.
+		 */
+		if (arvif->ahvif->vdev_type == WMI_VDEV_TYPE_STA)
+			dp_peer_addr = arvif->ahvif->vif->cfg.ap_addr;
+		else
+			dp_peer_addr = peer_addr;
+	}
 
 	key->hw_key_idx = key->keyidx;
 
-	/* the peer should not disappear in mid-way (unless FW goes awry) since
-	 * we already hold wiphy lock. we just make sure its there now.
-	 */
-	spin_lock_bh(&dp->dp_lock);
-	peer = ath12k_dp_link_peer_find_by_vdev_and_addr(dp, arvif->vdev_id,
-							 peer_addr);
-	if (!peer || !peer->dp_peer) {
-		spin_unlock_bh(&dp->dp_lock);
+	if (key->flags & IEEE80211_KEY_FLAG_PAIRWISE)
+		flags = WMI_KEY_PAIRWISE;
+	else
+		flags = WMI_KEY_GROUP;
 
+	/* Avoid sending DISABLE_KEY for an already deleted peer. */
+	spin_lock_bh(&ar->ah->dp_hw.peer_lock);
+	if (sta)
+		dp_peer = ath12k_dp_peer_find_by_addr_and_sta(&ar->ah->dp_hw,
+							      (u8 *)dp_peer_addr, sta);
+	else
+		dp_peer = ath12k_dp_peer_find_by_addr(&ar->ah->dp_hw,
+						      (u8 *)dp_peer_addr);
+	spin_unlock_bh(&ar->ah->dp_hw.peer_lock);
+	if (!dp_peer) {
 		if (cmd == SET_KEY) {
 			ath12k_warn(ab, "cannot install key for non-existent peer %pM\n",
 				    peer_addr);
 			return -EOPNOTSUPP;
 		}
-
-		/* if the peer doesn't exist there is no key to disable
-		 * anymore
-		 */
 		return 0;
 	}
 
-	spin_unlock_bh(&dp->dp_lock);
-
-	if (key->flags & IEEE80211_KEY_FLAG_PAIRWISE)
-		flags = WMI_KEY_PAIRWISE;
-	else
-		flags = WMI_KEY_GROUP;
-
 	ret = ath12k_install_key(arvif, key, cmd, peer_addr, flags);
 	if (ret) {
 		ath12k_warn(ab, "ath12k_install_key failed (%d)\n", ret);
@@ -6154,29 +6136,10 @@ static int ath12k_mac_set_key(struct ath12k *ar, enum set_key_cmd cmd,
 		return ret;
 	}
 
-	spin_lock_bh(&dp->dp_lock);
-	peer = ath12k_dp_link_peer_find_by_vdev_and_addr(dp, arvif->vdev_id,
-							 peer_addr);
-	if (peer && peer->dp_peer && cmd == SET_KEY) {
-		peer->dp_peer->keys[key->keyidx] = key;
-		if (key->flags & IEEE80211_KEY_FLAG_PAIRWISE) {
-			peer->dp_peer->ucast_keyidx = key->keyidx;
-			peer->dp_peer->sec_type =
-					ath12k_dp_tx_get_encrypt_type(key->cipher);
-		} else {
-			peer->dp_peer->mcast_keyidx = key->keyidx;
-			peer->dp_peer->sec_type_grp =
-					ath12k_dp_tx_get_encrypt_type(key->cipher);
-		}
-	} else if (peer && peer->dp_peer && cmd == DISABLE_KEY) {
-		peer->dp_peer->keys[key->keyidx] = NULL;
-		if (key->flags & IEEE80211_KEY_FLAG_PAIRWISE)
-			peer->dp_peer->ucast_keyidx = 0;
-		else
-			peer->dp_peer->mcast_keyidx = 0;
-	} else if (!peer)
-		/* impossible unless FW goes crazy */
-		ath12k_warn(ab, "peer %pM disappeared!\n", peer_addr);
+	ret = ath12k_dp_peer_set_key_config(&ar->ah->dp_hw, dp_peer_addr,
+					    cmd, key, sta);
+	if (ret)
+		return ret;
 
 	if (sta) {
 		ahsta = ath12k_sta_to_ahsta(sta);
@@ -6198,8 +6161,6 @@ static int ath12k_mac_set_key(struct ath12k *ar, enum set_key_cmd cmd,
 		}
 	}
 
-	spin_unlock_bh(&dp->dp_lock);
-
 	return 0;
 }
 
@@ -7040,30 +7001,13 @@ static void ath12k_mac_station_post_remove(struct ath12k *ar,
 	spin_unlock_bh(&dp->dp_lock);
 }
 
-static int ath12k_mac_station_unauthorize(struct ath12k *ar,
-					  struct ath12k_link_vif *arvif,
-					  struct ath12k_link_sta *arsta)
+static void ath12k_mac_station_unauthorize(struct ath12k *ar,
+					   struct ath12k_link_vif *arvif,
+					   struct ath12k_link_sta *arsta)
 {
-	int ret;
-
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
 	arsta->ahsta->is_authorized = false;
-
-	/* Driver must clear the keys during the state change from
-	 * IEEE80211_STA_AUTHORIZED to IEEE80211_STA_ASSOC, since after
-	 * returning from here, mac80211 is going to delete the keys
-	 * in __sta_info_destroy_part2(). This will ensure that the driver does
-	 * not retain stale key references after mac80211 deletes the keys.
-	 */
-	ret = ath12k_clear_peer_keys(arvif, arsta->addr);
-	if (ret) {
-		ath12k_warn(ar->ab, "failed to clear all peer keys for vdev %i: %d\n",
-			    arvif->vdev_id, ret);
-		return ret;
-	}
-
-	return 0;
 }
 
 static int ath12k_mac_station_authorize(struct ath12k *ar,
@@ -7750,6 +7694,40 @@ static int ath12k_mac_select_links(struct ath12k_base *ab,
 	return 0;
 }
 
+/*
+ * Clear cached key references before mac80211's station-removal grace
+ * period, so it also protects readers until ieee80211_free_sta_keys().
+ */
+void ath12k_mac_op_sta_pre_rcu_remove(struct ieee80211_hw *hw,
+				      struct ieee80211_vif *vif,
+				      struct ieee80211_sta *sta)
+{
+	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
+	struct ath12k_sta *ahsta = ath12k_sta_to_ahsta(sta);
+	unsigned long links = ahsta->links_map;
+	struct ath12k_link_vif *arvif;
+	struct ath12k_link_sta *arsta;
+	u8 link_id;
+	int ret;
+
+	lockdep_assert_wiphy(hw->wiphy);
+
+	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
+		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
+		arsta = wiphy_dereference(hw->wiphy, ahsta->link[link_id]);
+
+		if (WARN_ON(!arvif || !arsta || !arvif->ar))
+			continue;
+
+		ret = ath12k_mac_clear_peer_keys(arvif, sta);
+		if (ret && ret != -ENOENT)
+			ath12k_warn(arvif->ar->ab,
+				    "failed to clear peer keys for %pM link %u: %d\n",
+				    arsta->addr, link_id, ret);
+	}
+}
+EXPORT_SYMBOL(ath12k_mac_op_sta_pre_rcu_remove);
+
 int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 			    struct ieee80211_vif *vif,
 			    struct ieee80211_sta *sta,
diff --git a/drivers/net/wireless/ath/ath12k/mac.h b/drivers/net/wireless/ath/ath12k/mac.h
index 61c2ec8865a3..4bb845284838 100644
--- a/drivers/net/wireless/ath/ath12k/mac.h
+++ b/drivers/net/wireless/ath/ath12k/mac.h
@@ -251,6 +251,9 @@ int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 			    struct ieee80211_sta *sta,
 			    enum ieee80211_sta_state old_state,
 			    enum ieee80211_sta_state new_state);
+void ath12k_mac_op_sta_pre_rcu_remove(struct ieee80211_hw *hw,
+				      struct ieee80211_vif *vif,
+				      struct ieee80211_sta *sta);
 int ath12k_mac_op_sta_set_txpwr(struct ieee80211_hw *hw,
 				struct ieee80211_vif *vif,
 				struct ieee80211_sta *sta);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index a32c804403e8..6fde5170dd69 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -342,8 +342,10 @@ static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 	bool is_decrypted = false;
 	struct ieee80211_hdr *hdr;
 	struct ath12k_dp_peer *peer;
+	struct ieee80211_key_conf *key_conf = NULL;
 	struct ieee80211_rx_status *rx_status = rx_info->rx_status;
 	u32 err_bitmap = rx_info->err_bitmap;
+	u8 key_idx;
 
 	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
 			 "dp_rx_h_mpdu called without rcu lock");
@@ -374,10 +376,12 @@ static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 		 */
 		rxcb->is_mcbc = rxcb->is_mcbc && !peer->ucast_ra_only;
 
-		if (rxcb->is_mcbc)
-			enctype = peer->sec_type_grp;
-		else
-			enctype = peer->sec_type;
+		key_idx = rxcb->is_mcbc ? READ_ONCE(peer->mcast_keyidx) :
+				 READ_ONCE(peer->ucast_keyidx);
+		if (key_idx <= WMI_MAX_KEY_INDEX)
+			key_conf = rcu_dereference(peer->keys[key_idx]);
+		enctype = key_conf ? ath12k_dp_tx_get_encrypt_type(key_conf->cipher)
+				: HAL_ENCRYPT_TYPE_OPEN;
 	} else {
 		enctype = HAL_ENCRYPT_TYPE_OPEN;
 	}
@@ -1031,11 +1035,16 @@ static int ath12k_wifi7_dp_rx_h_verify_tkip_mic(struct ath12k_pdev_dp *dp_pdev,
 	tail_len = IEEE80211_CCMP_MIC_LEN + IEEE80211_TKIP_ICV_LEN + FCS_LEN;
 
 	if (!is_multicast_ether_addr(hdr->addr1))
-		key_idx = peer->ucast_keyidx;
+		key_idx = READ_ONCE(peer->ucast_keyidx);
 	else
-		key_idx = peer->mcast_keyidx;
+		key_idx = READ_ONCE(peer->mcast_keyidx);
 
-	key_conf = peer->keys[key_idx];
+	if (key_idx > WMI_MAX_KEY_INDEX)
+		goto mic_fail;
+
+	key_conf = rcu_dereference(peer->keys[key_idx]);
+	if (!key_conf)
+		goto mic_fail;
 
 	data = msdu->data + head_len;
 	data_len = msdu->len - head_len - tail_len;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 67c6fa79f859..f18a3741cca3 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -1085,6 +1085,7 @@ static void ath12k_wifi7_mac_op_tx(struct ieee80211_hw *hw,
 	u8 link_id;
 	int ret;
 	struct ath12k_dp *tmp_dp;
+	u8 keyidx;
 
 	if (ahvif->vdev_type == WMI_VDEV_TYPE_MONITOR) {
 		ieee80211_free_txskb(hw, skb);
@@ -1275,7 +1276,10 @@ static void ath12k_wifi7_mac_op_tx(struct ieee80211_hw *hw,
 				continue;
 			}
 
-			key = peer->dp_peer->keys[peer->dp_peer->mcast_keyidx];
+			keyidx = READ_ONCE(peer->dp_peer->mcast_keyidx);
+			key = (keyidx <= WMI_MAX_KEY_INDEX) ?
+				rcu_dereference(peer->dp_peer->keys[keyidx]) :
+				NULL;
 			if (key) {
 				skb_cb->cipher = key->cipher;
 				skb_cb->flags |= ATH12K_SKB_CIPHER_SET;
@@ -1335,6 +1339,7 @@ static const struct ieee80211_ops ath12k_ops_wifi7 = {
 	.set_key                        = ath12k_mac_op_set_key,
 	.set_rekey_data	                = ath12k_mac_op_set_rekey_data,
 	.sta_state                      = ath12k_mac_op_sta_state,
+	.sta_pre_rcu_remove             = ath12k_mac_op_sta_pre_rcu_remove,
 	.sta_set_txpwr			= ath12k_mac_op_sta_set_txpwr,
 	.link_sta_rc_update		= ath12k_mac_op_link_sta_rc_update,
 	.sta_set_4addr                  = ath12k_mac_op_sta_set_4addr,
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 5d0afbf0bd0c..c925141419c4 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -4948,8 +4948,9 @@ enum wmi_ap_ps_peer_param {
 
 #define DISABLE_SIFS_RESPONSE_TRIGGER 0
 
-#define WMI_MAX_KEY_INDEX   7
-#define WMI_MAX_KEY_LEN     32
+#define WMI_MAX_KEY_INDEX     7
+#define WMI_INVALID_KEY_INDEX (WMI_MAX_KEY_INDEX + 1)
+#define WMI_MAX_KEY_LEN       32
 
 enum wmi_key_type {
 	WMI_KEY_PAIRWISE = 0,

base-commit: e3485cc885b81314c814a43db2255b1f9100928f
-- 
2.34.1

