Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733275;
	b=ClbnjipdGNxlL9AhvQv1uJODjm0ebJQ2fVNGKyVz+F7dyQrJSzot3zbB5+EioOD2tFGc
	 1MeJkvdqXE75RhAFERDSw1AwLsMcZ1MY9N/LqDWfu1krWf8b0EkdBNElfXqK+fKyS15hK
	 +a1OaSTWfNkch+73/IlHujLnqTCOHyqu/mZGfUgcQbPbPYexkba5lk0rWwKVcUVlGF3fD
	 54hRjY5qE4dfilZPQPQXSrgMmC/pRZlwwBlwVVPChyol8P3QlqE6Wy8OKxkW9HToKqNPb
	 qjJfcDuXzjxBk7VbLY43hE/HGHIuMKqrglmHM3AsJRyuPBBzpYq5osI7v1Q5aS/R1vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733275;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Mukmc2KG3wwjBYiMVEGVg0jgZRmS/vq1YC9YmvojPbY=;
	b=z92KcEhpnuXXcG/YVxLauguX18HKB8zncfm4vMyf7iaVXo4RNTkJWNJTKGUN8DlYKkr5
	 A1gi2cJ3VSmxGz+SuG9Df0hgk51wnF5dfOKX6xt396rfouz7VkhEl10/nT5H13UXlZXTe
	 XPQeaFLB9fNu02zrjvdG3RfEVJb0BH18I1KaPVszIvDqaWKzyeSC/5sRKEwNomX5sYp6T
	 X7I9csSERuQRmRJIM+zIU6RV6WgNmRKZKkWAlToNhn/+XQqDjRTLwDWIO+vnOAt3uFLVK
	 4Zq6n4cIfDU8xEaC9mgTpwG/A6xhyzoBBLnc3hrabkG3llMqSlawVAIiFOE/0JabSgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VvW5VKUK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BcO5xLoH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F90606A31A
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 09:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18F90606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VvW5VKUK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BcO5xLoH
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF7wq7P2864366
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 09:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Mukmc2KG3wwjBYiMVEGVg0
	jgZRmS/vq1YC9YmvojPbY=; b=VvW5VKUKTbRKAq2oDpbbJ/yCgpAKp1dKw18Gpb
	ZzGQk+88wUqRQTdyzN8i0WDaADI6nzNNUE5yY3z1ULt/sKSGIglIZQEDDeW4X6D8
	+3hlwjK7wI9JW4k8cIsRp8pi4ab6w3fLdCGiIE9U2mXUWTPxlZcEf6D2ddWp75il
	X78hrfhuS8iBLsxlvgFKu/+EX0GWZSgSqWwS5cvoG/IVWwZl5Lyt/MRnvDswA5VW
	LKl6cA0Vy1DP9MX52w8ee+LwyI7fJ0xJwfmms0M7nNZgjiHLFwcLeA+Kf6OaFljp
	3lBJ00m08zHvNzO2Y7H8DskAvjfQoUw9P0ZJDGtc1DZ79tIQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmajkmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 09:01:13 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99e0e774882so415640241.3
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 01:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794733272; x=1795338072; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Mukmc2KG3wwjBYiMVEGVg0jgZRmS/vq1YC9YmvojPbY=;
        b=BcO5xLoHD2Brt+Wx6R0GiSjyBjEVLIi6DQN8tsKBB0yRyI1Ec2HF4ydKsMxBjk1cZP
         L1pP8xms06Vxg0jgdzri1NTpvSAwu9MqzRcArqvugfSc22SOzftPRLCLNM8b410KsQN+
         As81nDANtacQH9wZTKTxnbaXJasq1JgZQIiWDb1tkSFJxpadJcWcWtMLfGePctoszPAp
         YTQr1Ih4Ee+WtFO8nVsZUL2aONRKCdN5SuKyTylLyqAb53Iou8XuY1rvdV8GTP7ZdK6K
         remgxtR2URVMcZo9gfW/ogopso+J9QK7dqQxiJJkvxt9NzrrjrNTrGSpQfKnRvkxUZok
         niwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733272; x=1795338072;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Mukmc2KG3wwjBYiMVEGVg0jgZRmS/vq1YC9YmvojPbY=;
        b=zyJVO1zDM7htnxZdy73b1lb+vxM2tJYFcr13XVeN4uMhn4l5h5Z2eBh0F9/jdBQcuI
         FAV0/9VjlKI6C8slespuRzp4VAImJYh9C9X8gUtCOW/cK4BjkK/Kzj6+wJUvDVwr4Qet
         a8K5bY4NMrANWBxuOdd1LP8TTaZIKz5Meo3o41Nk3PCygsy6sS11njAbJkQAlTLF3dVB
         ZkqJKXoeg6SNu9VQT6vCq6hJQ57cKFywEWUCNDsUsNzl3x27r9gZ1Nv1CS6m45TQX9F3
         5Kgarr2k6q7Doj5K/iA/2x26mKxCqMFjseSMOlXmTLhcDH/BfiPCfQ48seJt7cmcw7s4
         caEg==
X-Forwarded-Encrypted: i=1; AL+hErGaNTflDY0Xp+XbW/VeCq1xjJA+fmg3anqbK1/KbBLlEbgDIwxljbAMbPSuoSDaXfG5Y6s/301hV38u94TxJg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+XCqC/jCD0XcopVq/0Bc519tGauF2K3j79JZCuwEZoq5cD+UjE
	oGvPMB0nWTLNK/dpQoQu60y9OnBXs75541eTxil0Dp917nNrD2Qfd6r/Yf7navzcJkPMWScgv2V
	90Zfjh0LngaNt2WOALunXPPfXXOdrFOvm+9S4W6guSmp/swq6ZPv0QkEhWeYwX/O5K1aRgTJpgq
	usTA==
X-Gm-Gg: AYBFou2GsOTtnThLtSzZmaaOC15705jbU0FgxypCnP7MGSpvGlkiCw/fsJuV8Ydwmx7
	yMWqITLeHFnBCymsIGRpc07jpR+SqfBorQtY+E1UU+pYtfJ2CpK/9mCqlMT6rIQE47wrLJRaRCg
	qbMEN9gmPX/MffyzQ0qM/RzJjSFUkiRWauAEmLq2ytvopZxF0/v2YCcVux6K7iUq5HdI6PUyk1G
	mjxgsEwsQ74pJdNp/Uu9rzEZ8R7lrH7vWh2gabxE0DDRN6huE18YubpiHEoa1LTAOmD9tw59yIG
	ASByYrYuiu8UMOKyeZAkBBpezcKdnCn4oYMOgiFGlzg3OczODgeEWtUDKAf9+zaeh9xxPzDwrYu
	/0SRyjmSidtYNLtGBQv5UtZwTrMJVmaM9jhJmVf5xwcV9MNOf3bFRcnApkKhMyQ==
X-Received: by 2002:a05:6102:5ccb:b0:7cc:9a7:7b83 with SMTP id ada2fe7eead31-7d64d72ba7fmr2881217137.15.1794733272310;
        Sun, 15 Nov 2026 01:01:12 -0800 (PST)
X-Received: by 2002:a05:6102:5ccb:b0:7cc:9a7:7b83 with SMTP id ada2fe7eead31-7d64d72ba7fmr2881205137.15.1794733271660;
        Sun, 15 Nov 2026 01:01:11 -0800 (PST)
Received: from localhost ([93.66.91.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm81511375e9.1.2026.11.15.01.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:01:09 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 10:00:56 +0100
Subject: [PATCH ath-current v4] wifi: ath12k: fix DMA direction for
 re-injected Rx buffers
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-ath12k-fix-dma-mapping-for-reinject-packets-v4-1-27efef2890f8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6XOzU7DMAwH8FeZcsZT80G37sR7IA6O665hNClJV
 oGmvjtWxYEDHCYulv7yx883VTgHLuq0u6nMSyghRQnuYadoxHhmCL1kZRrT6kY7wDpqc4EhfEA
 /IUw4zyGeYUgZMof4ylRhRrpwLWAYvXWEj0ik5OKcWfY27VnJIaBrzhyrepHmGEpN+XP7ZNHby
 Dd6uAtdNGjwnTu2DeujR/eUStm/X/GN0jTtpWzcYn4Qxt5HGCG6wdkWTdv3B/MHYf9BWCGcs0P
 H2npP3S/Euq5fULGnqsABAAA=
X-Change-ID: 20261014-ath12k-fix-dma-mapping-for-reinject-packets-2eab34ca5acc
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: zrlYE4ZdCdlro2G7Z9HeionRw0BEpKNs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDAzNSBTYWx0ZWRfX+xA8TaBsGuLM
 0RDC3m0pL6QnMiBOJgXBbVjcOhQOfrhhwFwSavjl7yeChtQ0+mvPFWho5T99QMT5uwdL/TQueM4
 zhBcwC5JeX63AAatJQS3Tu12MlY6b5TgYNaWP1AeNjn3b4WYRC1w5yRXeWskfzdBM1Yo7IltR7a
 q9bm4yNuJZ6IQHWFt+3saQnzUWm3G3FdwqbDW5pS6lwfOiAZytzQhffYuQ53/B0D0A0R0MYVEPs
 P4fUVi6qVBNvk8yGqNx8NxM0qIdNdHzs3p/FW2V6MOUuzPVBm7tU1ssFShMcqP4ZybubKgzAa93
 dG2i5kbUGlXTPh+mhH4chbyQURGybJoZepaJGzLRwEvR/zL83plZ/PWMX75qVtpoimiMcaOhtZl
 hiJzMF7zGRxR3w3YfdpS4KvRCcXNRMluYHlOHuUJKNae1xA7LbLIrYTHU5QvCFRfHU7MBPmqkwL
 w1vKzIeLAkKL9LsKbnQ==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6af974d9 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=8zQ3sPA27H7dy4zktjPBAQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ElIqd8a8I0mOhK9pBAoA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: zrlYE4ZdCdlro2G7Z9HeionRw0BEpKNs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDAzNSBTYWx0ZWRfXxgWJoJSmYRYG
 R5YkZcTvj4Vyjcs0RoBgF/e4VKMkbumyt7WckRV3g5K94nTCVa9ZFs29yk2oMlCG50Cf6eWu+2F
 b1XKO+cweDQFrvzMCBef2SWVes9Wshk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150035

Defragmented MPDUs that are re-injected into the REO are mapped with
DMA_TO_DEVICE, but all the Rx reap and teardown paths unmap them with
DMA_FROM_DEVICE. The DMA API requires the unmap direction to match the
map direction, so this violates the contract.

The mapping actually spans both directions, since the host has written
the buffer before the REO reads it and the buffer is read back by the
host afterwards, so DMA_BIDIRECTIONAL is the correct choice.

Add a common ath12k_dp_unmap_rx_buf() helper that selects
DMA_BIDIRECTIONAL for re-injected buffers, identified by the existing
ath12k_skb_rxcb::is_frag flag, and DMA_FROM_DEVICE otherwise, then use it
in all the Rx reap and cleanup paths. Map and unmap the re-injected buffer
with DMA_BIDIRECTIONAL consistently.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 33322e3ef074 ("wifi: ath12k: change DMA direction while mapping reinjected packets")
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
Changes in v4:
- Rebase on top of ath-current branch in order to fix conflicts.
- Link to v3: https://lore.kernel.org/r/20261023-ath12k-fix-dma-mapping-for-reinject-packets-v3-1-443f9e13bbc9@oss.qualcomm.com

Changes in v3:
- Set ATH12K_SKB_RXCB()->paddr before err_unmap_dma condition in
  ath12k_wifi7_dp_rx_h_defrag_reo_reinject().
- Link to v2: https://lore.kernel.org/r/20261023-ath12k-fix-dma-mapping-for-reinject-packets-v2-1-9f436a26dd72@oss.qualcomm.com

Changes in v2:
- Rely on ath12k_skb_rxcb is_frag field and drop reinjected one.
- Link to v1: https://lore.kernel.org/r/20261017-ath12k-fix-dma-mapping-for-reinject-packets-v1-1-b94860e18ba4@oss.qualcomm.com
---
 drivers/net/wireless/ath/ath12k/dp.c           |  6 ++---
 drivers/net/wireless/ath/ath12k/dp_mon.c       |  5 ++--
 drivers/net/wireless/ath/ath12k/dp_rx.c        |  3 +--
 drivers/net/wireless/ath/ath12k/dp_rx.h        | 11 ++++++++
 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c | 17 +++---------
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c  | 37 ++++++++------------------
 6 files changed, 31 insertions(+), 48 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 83f9edfabf69..5ef4cf8b9b39 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -5,6 +5,7 @@
  */
 
 #include "core.h"
+#include "dp_rx.h"
 #include "dp_tx.h"
 #include "hif.h"
 #include "hal.h"
@@ -1003,10 +1004,7 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
 					continue;
 
 				if (!ATH12K_SKB_RXCB(skb)->unmapped)
-					dma_unmap_single(ab->dev,
-							 ATH12K_SKB_RXCB(skb)->paddr,
-							 skb->len + skb_tailroom(skb),
-							 DMA_FROM_DEVICE);
+					ath12k_dp_unmap_rx_buf(dp, skb);
 				dev_kfree_skb_any(skb);
 			}
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index ae14e118fe36..3d9092ff9353 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -5,6 +5,7 @@
  */
 
 #include "dp_mon.h"
+#include "dp_rx.h"
 #include "debug.h"
 #include "dp_tx.h"
 #include "peer.h"
@@ -558,9 +559,7 @@ ath12k_dp_mon_parse_status_buf(struct ath12k_pdev_dp *dp_pdev,
 		return 0;
 	}
 
-	dma_unmap_single(ab->dev, ATH12K_SKB_RXCB(msdu)->paddr,
-			 msdu->len + skb_tailroom(msdu),
-			 DMA_FROM_DEVICE);
+	ath12k_dp_unmap_rx_buf(dp, msdu);
 
 	offset = packet_info->dma_length + ATH12K_MON_RX_DOT11_OFFSET;
 	if (ath12k_dp_pkt_set_pktlen(msdu, offset)) {
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 36be543b7c50..7853d215d81b 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -185,8 +185,7 @@ static int ath12k_dp_rxdma_mon_buf_ring_free(struct ath12k_base *ab,
 		/* TODO: Understand where internal driver does this dma_unmap
 		 * of rxdma_buffer.
 		 */
-		dma_unmap_single(ab->dev, ATH12K_SKB_RXCB(skb)->paddr,
-				 skb->len + skb_tailroom(skb), DMA_FROM_DEVICE);
+		ath12k_dp_unmap_rx_buf(ath12k_ab_to_dp(ab), skb);
 		dev_kfree_skb_any(skb);
 	}
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index 82700474548a..7e1f12c68316 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -187,6 +187,17 @@ void ath12k_dp_extract_rx_desc_data(struct ath12k_hal *hal,
 	hal->ops->extract_rx_desc_data(rx_info, rx_desc, ldesc);
 }
 
+static inline void ath12k_dp_unmap_rx_buf(struct ath12k_dp *dp,
+					  struct sk_buff *skb)
+{
+	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(skb);
+	enum dma_data_direction dir;
+
+	dir = rxcb->is_frag ? DMA_BIDIRECTIONAL : DMA_FROM_DEVICE;
+	dma_unmap_single(dp->dev, rxcb->paddr, skb->len + skb_tailroom(skb),
+			 dir);
+}
+
 void ath12k_dp_rx_h_undecap(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu,
 			    enum hal_encrypt_type enctype,
 			    bool decrypted,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
index 1e29c13ad66d..2327ac05e073 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
@@ -2722,10 +2722,7 @@ ath12k_wifi7_dp_rx_mon_mpdu_pop(struct ath12k *ar, int mac_id,
 				drop_mpdu = true;
 			}
 			if (!rxcb->unmapped) {
-				dma_unmap_single(ar->ab->dev, rxcb->paddr,
-						 msdu->len +
-						 skb_tailroom(msdu),
-						 DMA_FROM_DEVICE);
+				ath12k_dp_unmap_rx_buf(dp, msdu);
 				rxcb->unmapped = 1;
 			}
 			if (drop_mpdu) {
@@ -3135,9 +3132,7 @@ ath12k_wifi7_dp_rx_reap_mon_status_ring(struct ath12k_base *ab, int mac_id,
 				idr_remove(&rx_ring->bufs_idr, buf_id);
 				spin_unlock_bh(&rx_ring->idr_lock);
 
-				dma_unmap_single(ab->dev, rxcb->paddr,
-						 skb->len + skb_tailroom(skb),
-						 DMA_FROM_DEVICE);
+				ath12k_dp_unmap_rx_buf(dp, skb);
 
 				dev_kfree_skb_any(skb);
 				pmon->buf_state = DP_MON_STATUS_REPLINISH;
@@ -3148,9 +3143,7 @@ ath12k_wifi7_dp_rx_reap_mon_status_ring(struct ath12k_base *ab, int mac_id,
 			idr_remove(&rx_ring->bufs_idr, buf_id);
 			spin_unlock_bh(&rx_ring->idr_lock);
 
-			dma_unmap_single(ab->dev, rxcb->paddr,
-					 skb->len + skb_tailroom(skb),
-					 DMA_FROM_DEVICE);
+			ath12k_dp_unmap_rx_buf(dp, skb);
 
 			if (ath12k_dp_pkt_set_pktlen(skb, RX_MON_STATUS_BUF_SIZE)) {
 				dev_kfree_skb_any(skb);
@@ -3292,9 +3285,7 @@ ath12k_wifi7_dp_mon_srng_process(struct ath12k_pdev_dp *pdev_dp, int *budget,
 		}
 
 		rxcb = ATH12K_SKB_RXCB(skb);
-		dma_unmap_single(ab->dev, rxcb->paddr,
-				 skb->len + skb_tailroom(skb),
-				 DMA_FROM_DEVICE);
+		ath12k_dp_unmap_rx_buf(dp, skb);
 
 		end_reason = u32_get_bits(info0, HAL_MON_DEST_INFO0_END_REASON);
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index a32c804403e8..f9abcd047a8a 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -741,11 +741,7 @@ int ath12k_wifi7_dp_rx_process(struct ath12k_dp *dp, int ring_id,
 
 		list_add_tail(&desc_info->list, &rx_desc_used_list[device_id]);
 
-		rxcb = ATH12K_SKB_RXCB(msdu);
-		dma_unmap_single(partner_dp->dev, rxcb->paddr,
-				 msdu->len + skb_tailroom(msdu),
-				 DMA_FROM_DEVICE);
-
+		ath12k_dp_unmap_rx_buf(partner_dp, msdu);
 		num_buffs_reaped[device_id]++;
 		dp->device_stats.reo_rx[ring_id][dp->device_id]++;
 
@@ -761,6 +757,7 @@ int ath12k_wifi7_dp_rx_process(struct ath12k_dp *dp, int ring_id,
 		msdu_info = &desc->rx_msdu_info;
 		mpdu_info = &desc->rx_mpdu_info;
 
+		rxcb = ATH12K_SKB_RXCB(msdu);
 		rxcb->is_first_msdu = !!(le32_to_cpu(msdu_info->info0) &
 					 RX_MSDU_DESC_INFO0_FIRST_MSDU_IN_MPDU);
 		rxcb->is_last_msdu = !!(le32_to_cpu(msdu_info->info0) &
@@ -906,10 +903,12 @@ static int ath12k_wifi7_dp_rx_h_defrag_reo_reinject(struct ath12k_dp *dp,
 
 	buf_paddr = dma_map_single(dp->dev, defrag_skb->data,
 				   defrag_skb->len + skb_tailroom(defrag_skb),
-				   DMA_TO_DEVICE);
+				   DMA_BIDIRECTIONAL);
 	if (dma_mapping_error(dp->dev, buf_paddr))
 		return -ENOMEM;
 
+	ATH12K_SKB_RXCB(defrag_skb)->paddr = buf_paddr;
+
 	spin_lock_bh(&dp->rx_desc_lock);
 	desc_info = list_first_entry_or_null(&dp->rx_desc_free_list,
 					     struct ath12k_rx_desc_info,
@@ -927,8 +926,6 @@ static int ath12k_wifi7_dp_rx_h_defrag_reo_reinject(struct ath12k_dp *dp,
 	list_del(&desc_info->list);
 	spin_unlock_bh(&dp->rx_desc_lock);
 
-	ATH12K_SKB_RXCB(defrag_skb)->paddr = buf_paddr;
-
 	ath12k_wifi7_hal_rx_buf_addr_info_set(&msdu0->buf_addr_info, buf_paddr,
 					      desc_info->cookie,
 					      HAL_RX_BUF_RBM_SW3_BM);
@@ -995,8 +992,8 @@ static int ath12k_wifi7_dp_rx_h_defrag_reo_reinject(struct ath12k_dp *dp,
 	list_add_tail(&desc_info->list, &dp->rx_desc_free_list);
 	spin_unlock_bh(&dp->rx_desc_lock);
 err_unmap_dma:
-	dma_unmap_single(dp->dev, buf_paddr, defrag_skb->len + skb_tailroom(defrag_skb),
-			 DMA_TO_DEVICE);
+	ath12k_dp_unmap_rx_buf(dp, defrag_skb);
+
 	return ret;
 }
 
@@ -1298,7 +1295,6 @@ ath12k_wifi7_dp_process_rx_err_buf(struct ath12k_pdev_dp *dp_pdev,
 	struct ath12k_dp *dp = dp_pdev->dp;
 	struct ath12k_hal *hal = dp->hal;
 	struct sk_buff *msdu;
-	struct ath12k_skb_rxcb *rxcb;
 	struct hal_rx_desc_data rx_info;
 	struct hal_rx_desc *rx_desc;
 	u16 msdu_len;
@@ -1328,11 +1324,7 @@ ath12k_wifi7_dp_process_rx_err_buf(struct ath12k_pdev_dp *dp_pdev,
 	desc_info->skb = NULL;
 
 	list_add_tail(&desc_info->list, used_list);
-
-	rxcb = ATH12K_SKB_RXCB(msdu);
-	dma_unmap_single(dp->dev, rxcb->paddr,
-			 msdu->len + skb_tailroom(msdu),
-			 DMA_FROM_DEVICE);
+	ath12k_dp_unmap_rx_buf(dp, msdu);
 
 	if (drop) {
 		dev_kfree_skb_any(msdu);
@@ -1379,7 +1371,6 @@ static int ath12k_dp_h_msdu_buffer_type(struct ath12k_dp *dp,
 					struct hal_reo_dest_ring *desc)
 {
 	struct ath12k_rx_desc_info *desc_info;
-	struct ath12k_skb_rxcb *rxcb;
 	struct sk_buff *msdu;
 	u64 desc_va;
 
@@ -1410,9 +1401,7 @@ static int ath12k_dp_h_msdu_buffer_type(struct ath12k_dp *dp,
 	msdu = desc_info->skb;
 	desc_info->skb = NULL;
 	list_add_tail(&desc_info->list, list);
-	rxcb = ATH12K_SKB_RXCB(msdu);
-	dma_unmap_single(dp->dev, rxcb->paddr, msdu->len + skb_tailroom(msdu),
-			 DMA_FROM_DEVICE);
+	ath12k_dp_unmap_rx_buf(dp, msdu);
 	dev_kfree_skb_any(msdu);
 
 	return 0;
@@ -1998,12 +1987,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 		}
 
 		list_add_tail(&desc_info->list, &rx_desc_used_list[device_id]);
-
-		rxcb = ATH12K_SKB_RXCB(msdu);
-		dma_unmap_single(partner_dp->dev, rxcb->paddr,
-				 msdu->len + skb_tailroom(msdu),
-				 DMA_FROM_DEVICE);
-
+		ath12k_dp_unmap_rx_buf(partner_dp, msdu);
 		num_buffs_reaped[device_id]++;
 		total_num_buffs_reaped++;
 
@@ -2017,6 +2001,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 		}
 
 		msdu_data = (struct hal_rx_desc *)msdu->data;
+		rxcb = ATH12K_SKB_RXCB(msdu);
 		rxcb->err_rel_src = err_info.err_rel_src;
 		rxcb->err_code = err_info.err_code;
 		rxcb->is_first_msdu = err_info.first_msdu;

---
base-commit: b1ed5a45b994a6473ca1cf34f35a1bf87f1d8e2a
change-id: 20261014-ath12k-fix-dma-mapping-for-reinject-packets-2eab34ca5acc

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

