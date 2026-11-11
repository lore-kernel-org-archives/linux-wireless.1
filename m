Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794414131;
	b=4kviHZbha9WzZSfCAi7u3f0SMit09UKFnDEI9/3DScuSMFhO1BVOXMwvI6RnSR9j+BDB
	 N7qH/KFERMyajnGOmBvmQ7r35v3V2bNlQmUktoQeZPz5REOcUFeylhpaQ5+ol/KSEruub
	 qwyWft/VDcyTtX56LJ1LL30qDuOdX1DnRIuSqz8nJkpW+MilhN4kKQCfRcOSnRGUZMReV
	 1st4fwmgU5/H9d5O21fQuoocNLq7BPl92nSrNyyQSWbhuvrXvBL7jHZVz1WEq6mnw5J4z
	 Nrc5SVQGx6BhSLfDoBC3bvi33UCyiQGw3Wp1pgonivjrJcX5TKmokRnrmRCC3NVPSPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794414131;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pvn0sQHTZMzorBQux6BXwkwGi8BOFiSRo4wms43N6Ck=;
	b=TKfy1fl5aZnYkUpYl6Pz9ks7H91YxJkpR8FyKlPTm0r430IX9ZhJsmMjV8W6d0aaG45m
	 DWog13+NHEOZ7rBAJ73KaVlTKVNjS+MX827al9qdk2M2kWV3mwPJ3ihjpGew4yl63ISYl
	 gDiGXkGPAwbpO82hRxRR2Oa2x2Y0tpKp9c637kkPbKSdFwiAR9pqeUf7a99GenuGXcdu5
	 5tpeftBF5GUrgVtJDf2Is4uto+Fi2Slg27ux4UW7ZoEnwh5FZStIfb6LqwcvmJVIv5wPx
	 jtCaQbkYqVXZ6dWZW2IRhDfSCsZTfePsWFekixarM+U7RSBjq5+gwNI2tvDhGhADbbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XTt915OF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OAoVB0Wm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56356606A880
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 16:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56356606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XTt915OF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OAoVB0Wm
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0Oq52665120
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 16:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pvn0sQHTZMzorBQux6BXwk
	wGi8BOFiSRo4wms43N6Ck=; b=XTt915OFCvv33oS41yWUKe766/VwsJA7fwCECH
	j9FyYnhpKYLcwmVHouFKLEFB54EUzaW4Pw5+FOkRI5nwUgWOBz1nFohIlfLTo9XF
	X+9tnRBbL4xrU39h0Ul5sbe5IpH7aw/JpFAYhxb2Q+W5ifnyhhjhyBTZvwn+MJ7y
	w762Gi5IIweAAnE5831IHayWKhSMDuhuH+Xkf91A2sxMPFUmFayoT6NNmkdizT6N
	myQAEOrAfoMsI5+7M03aWbHq/QSO+HIlw7vJtkeULqHhgWjgeMnCbaZlgBgPnAJC
	slvk84uUBRvGbNACU0ZQM2c3rvLhYWl2+He/1viCGiGZbbLw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdjqd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 16:22:10 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b25d977b91so4316020c88.1
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 08:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794414130; x=1795018930; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pvn0sQHTZMzorBQux6BXwkwGi8BOFiSRo4wms43N6Ck=;
        b=OAoVB0Wmb9/n8OFxBBzpTsb+SwWX6AXXya1enWbxI8WxC7xdh8hicQNsWQjJi0MrnQ
         B0Au1hsT6uUgCbQUqJyQJtO8ssTyut/H9Q7mCKtg48webo7WVAlCKvNsQLFhvxTsLsRP
         sBn/O0ZhXSE4pfqLAfnXh66az3VDqEwhmFB7Vwl7QquRHxvz6yRSMzGqQ+5kVUVbnwJy
         ZxgGfWhhMxq8vkn8uoRW6USMvdQtvteOBRZUe1ngql0iScFNGIYzvieBcKBxUV2w0S+O
         JSHIR526ieEkfJfEenjvCDmO3KKwmkeaioxLD1DG22moCMQZL9BPxOUWk17IMXFvxGZT
         Up2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794414130; x=1795018930;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pvn0sQHTZMzorBQux6BXwkwGi8BOFiSRo4wms43N6Ck=;
        b=szTffKBCAWdMTJ7FLWZS6HAwcgdcbShRwzPPJkyPhdhYG4i5UJdkO/ild7LdUW0Vid
         kK/NhWBUr6XRhex8UTVBMguE2f6dF6R6uYd1hTzOSsUumxZqBGyEzKt+rnA0gw3Yx1VC
         YGB5LF/ob7HK6xX7YJN0Mah5P9x/bDLuhVrsoXzNdJDDzO3tY3DJXC6fhi3d8KChqb00
         PYIgaHCqgDJ2pDeKTiTxj/zXNlXVWspAMCMWv4MiWEEvg4ykXqsWbU1nR1XV8Fu8tHKV
         gSMcJI717aeGKuA78jTsh925piPBoRn+M8sQ6rwdS2E22NWyR5ka/aRnnnr+aB+kN5k1
         bKKw==
X-Gm-Message-State: APuU4Z/1GIijWQUOOhSsJ/18Cx/T6uFj2w380i9u/C8Ocm/4YnEerwxJ
	kKbozxWOLvzk2kv7wzd5KgN4Ude+lsZso8dajF3Z7CkzKMhxW7V4nQqCxgqGzyn+JT6uuEKjl77
	7mAkGBhNVZBPZJVWKtvsdRISWk3ZcSuuTpwKy47GLjYN+PAhQo9Po/eqIorSL45WdfjNpng==
X-Gm-Gg: AYBFou2jDx6FnnjA5GCPKVy/nxUi3Pf4qxd5yiDyLOU0aGzuxaR3CeT965Y8bVctij6
	5O5mI31eZvfqGcZKDAZQN8kXzswHO7U5SnuKe6dWvurvV0wdSe5e8xtX3nAayj6n9NSInY88hsN
	bqcht2ymnXeUcSQ2v46vkRpylDn7z2ar2OzPA7C3WtioX0eZCfLUVT9CQcx6HVJXFfyqMZbYfwW
	HG53ktZGpUlO+Vqv1xofRYSjq7WS1/9P3vfYl23FbXrL/944pnBetPKcO/kzUaRvyXLOOjHi3Ik
	fHL/D8JSA6O90cSDqIBNic3Bh5akjeoDy930IcPc0HMzpc0YopEDxA5xs+rbhUj5X0LTS/CWvf2
	FjVXY96t2CPV4EZFijX38zH43b2TPY8lqUU/u8vw/tzaX8NBAMg43QqWZQRz5SDDD4xVE+L2hgD
	z4BtUdzK/AwC3DTzbTxLRUhLAZo9g=
X-Received: by 2002:a05:7022:ea4a:b0:1a3:9936:d11e with SMTP id a92af1059eb24-1b3c034aff7mr2676022c88.41.1794414129470;
        Wed, 11 Nov 2026 08:22:09 -0800 (PST)
X-Received: by 2002:a05:7022:ea4a:b0:1a3:9936:d11e with SMTP id a92af1059eb24-1b3c034aff7mr2675992c88.41.1794414128488;
        Wed, 11 Nov 2026 08:22:08 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm17802931c88.9.2026.11.11.08.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:22:07 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 08:22:06 -0800
Subject: [PATCH ath-next] wifi: ath12k: use str_enable_disable() in mac.c
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
Message-Id: <20261111-ath12k-coccicheck-mac-v1-1-6d8ac143ef05@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAC2W9GoC/4WOwQ6CMBBEf4Xs2SVtUVI9+R+GQ1mKrQjVthAM4
 d8t+AFeJpnMvtlZIGhvdYBLtoDXkw3WDcnwQwZk1HDXaJvkQTBRcs4Zqmi46JAckSWjqcNeEdY
 nJc+saWVJR0jsy+vWznvvDRKCg54jVL8kjPVDU9xqt1tjQ3T+s0+Y+E78+TZx5CiLljVFXQgh6
 epCyN+jepLr+zwJVOu6fgEtvc9Z3QAAAA==
X-Change-ID: 20261110-ath12k-coccicheck-mac-b5a890df86c4
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        kernel test robot <lkp@intel.com>,
        Julia Lawall <julia.lawall@inria.fr>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af49632 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=Br0jzTNd2fROkmabWI8A:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: Z17O8Hdxke9fe04yNu9wemimOh3iScfx
X-Proofpoint-GUID: Z17O8Hdxke9fe04yNu9wemimOh3iScfx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NSBTYWx0ZWRfX9fYbYrtMgiCb
 V+80CHe+z5/z4a7NsnXhVODA6vgfe0Uzvzf9KLAvdnTyAwlAI8AeXaLH0QPrDLQf875GtYEDKHx
 uQkkl9ayzies6wWF2MxJ/HQBJ9VQ3veNBE3NHu836kwCaKAMHDJBn5t7JUzYrkomqr/UG6Bvyyy
 iixQYIZMNliNDEGlFxlNP5Gjl7svpY4wedLwQzihR7ZxQp4LJ8Q3zoquFw3OwOOCycwrkQsS9mr
 Or4E+LYvWeBMiCRViBO+mzBWJxJjTL6Einj76D5m0myXtvWx57roJfbH4w2YJDeep2cGsdudoZq
 Rj0Hoex7/gHCnl4DNM6YZ3rPORRM5zr8ZJMFNzMNvE1l14oJPol5fkRx/A13E0BFGEfeRbhAAr9
 ip+K5AUFrNxUBNBAkr6t/UR7dIsrJbCJyEbQflarOGk/JCgDVtX7WAC0bk9WshxC6uBU0Cnjvy4
 UlAVHFFGE1yLQJ//KEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NSBTYWx0ZWRfXxOuwuSuKl8vX
 Y2yDmdrpuQA478g+g+bGaUACGeKUtHt/C+z3xuENWqglcEX/aaJZzqF2Ua0qxZDDWLVWCzhOaGI
 NwuA0d2gruabsSIxPvRrH0+BhGLDUr8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110065

"make coccicheck M=drivers/net/wireless/ath/ath12k" reports:

./mac.c:4556:21-27: opportunity for str_enable_disable(psmode)

Update ath12k_mac_vif_setup_ps() to use the str_enable_disable() helper.

Compile tested only.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/r/202411011943.yYxnp7QA-lkp@intel.com/
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4f16c78b52a8..b37ec64cb639 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7,6 +7,7 @@
 #include <net/mac80211.h>
 #include <net/cfg80211.h>
 #include <linux/etherdevice.h>
+#include <linux/string_choices.h>
 
 #include "mac.h"
 #include "core.h"
@@ -4553,7 +4554,7 @@ static void ath12k_mac_vif_setup_ps(struct ath12k_link_vif *arvif)
 	}
 
 	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac vdev %d psmode %s\n",
-		   arvif->vdev_id, psmode ? "enable" : "disable");
+		   arvif->vdev_id, str_enable_disable(psmode));
 
 	ret = ath12k_wmi_pdev_set_ps_mode(ar, arvif->vdev_id, psmode);
 	if (ret)

---
base-commit: e3485cc885b81314c814a43db2255b1f9100928f
change-id: 20261110-ath12k-coccicheck-mac-b5a890df86c4

