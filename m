Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795633364;
	b=2P1luEuHOUCxYStInpfm33LReKB2rA/hLqwuT1Q7SP+9/7kmYtaYUvGjSzzs7yC9E9q6
	 zv6b3XujgUTTZh9Pqt30lq+Sr2XnJH+FBxTPAE2i9NFTYvYPJ8Qbitzqo71OcrPQyzih5
	 SvBHOu6VwBx43d85KQrvHMqvpVRR3M2R2ZW2U2SmuJ5Qdbo2M6kxtOXDtk4UoSEGdJdpW
	 LWcIby7D6tGRQhV31zo967hect4ZYCA5D8OFEqdmdhhLtJaE0z1GC0QyBC/SNv91qotbq
	 ZbxUD4S4hxbQVnr6l7+Vi9Tasftts4vS1roJt3TBxoCFVQIgzyAdlgpwNiBoDL0puyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795633364;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SYfr/zPrMJuFW99fIND5ARlpQPIk0eMxu9GKUIqxcIE=;
	b=h8la9EvQwIGH7lQt6OP5IMIupp1jnnT00xev1AidTB37SBEJ8aYyNtkZ0/8EHqGNV76h
	 GOJTl0f6g86WuR57X5knakyywkdSq/JUDj+Vk4BFXQia4zRfGk+iZsTh+6lK4t42y3nPa
	 9aeKFkFenx56OCE7ZsEz8GSnGqMM1UwS0al7McYdeMyAQp8NZCjjCHvLy13Ryv75O55q/
	 knQ4ihWIj78Q8xppZnfSUOpTy9V+Fcw1QHXOhCDTiVH7N+extAMwCVWDoLn1qfQZCapbi
	 ovrFMX6pk3UXwbwTcZJQfFCuNYmyeeMPLx58plwcf09buRcQEHPwwhE3qBSB/jPCc1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oRGDcvaF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B+XYQ2Fg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4A6606A321
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 19:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D4A6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oRGDcvaF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B+XYQ2Fg
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQ3NG1670737
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 19:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SYfr/zPrMJuFW99fIND5AR
	lpQPIk0eMxu9GKUIqxcIE=; b=oRGDcvaFvGx6RAaboDq/dPZwyriYwiCWk1dp9E
	sF8xCXoUavwahYh65aY7jVnhzzwS/9tA3ASB2ppfa+14yB/4VWJpQEASyh2EGtXb
	7gcjek7Cq9J0E7+FkCoPX+CN8xu+u4zFEYE8XbV3yi2Ix4GqBNLHbuUWA/2Cii3B
	zTYnDeJ/08uFedescaLy1QnVUPtDVQCNXl8TQaynRKdUNDHVIrgPLbCIDY5fzONA
	thlaF/DJzPZrvxevzLgy8h80elC/vi69YtiQnip4Ad4EfNrx/M3b9yNatLZt5Bt7
	LORufeE5gyBWVLGzrlIq0OaU+X0ApL/5rVQUU7WYCXYH36kQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62varpxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 19:02:42 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-382af5cfc58so1466059eec.0
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 11:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795633361; x=1796238161; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SYfr/zPrMJuFW99fIND5ARlpQPIk0eMxu9GKUIqxcIE=;
        b=B+XYQ2Fgt0B87UlvaHfc11cLVVKzGwcBNVJctfPANvPUxmQDL9TPiGeL7VOhvZIXOZ
         MQzc1Fr5XalzSJxA6w3KexHug8DBrRi8dgKEnWVqSi1e+uE4v5OTW/IPJPZRDTjObrXE
         ihfYWrdOppLguy7LADliLUhGBXAYHihXZsH328OHrV1Kq7HrAjOBO63BBOcu3eHHcKAz
         y7WaWMQzwsSsKl4wwd6ETfxgWnA0fhPLOkycRPFEbH+h1gUoos4Oim4v5OqjfguLAaiw
         hJQk8MvrP20qkagnluuKwt02oiedzByokH08xQttiI9Cu6pW55XmwSCleS8gea0XhfCT
         hlaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795633361; x=1796238161;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SYfr/zPrMJuFW99fIND5ARlpQPIk0eMxu9GKUIqxcIE=;
        b=d93bbm2OBMpnc6kidttotxYVnmO9/9DlRdACKPoXGd/eSPIotJufqUcCj20/6e/wo9
         OwEsGIG5CVi/fOv9X0epUxtKwqAeuZT77mZ5DpP1qGFRv1LKVrthutA6WQwH2jxY8MjB
         YbMtl8akHLjA/uUe2Ti5FUyFh6aPi4kkszOxG/ktH313v4uJosEys0WRMtdvYiLQh8sF
         KxNu/xTRC/4OexF2ru9HTB6jF3tY/7w5z38CGzOnOFRbT8r+Uk+Mpa2iFuwDqckJs2B4
         9s9cdaP4NAIhWjsz3YXjw/nM8yC+9zZf7j9lr4kjGdpWHXXbSR+Sl3zxY2xYU4VCarFU
         Cn8w==
X-Gm-Message-State: APuU4Z9McJz++lt8H2Tg05pAImf0oNSbipeGcJYbK2LYvKwSgvZXUECG
	HoyzFlwKogWoo6gUFC3ogqdS95YwnVS2VZ3Plonfswjf9APUOcg/3J25yQu2yDutjsvALFuFY+q
	5LhEXPxSsC/gjLeXKoOptrCphUE6RBeEI1+yCWGws2cW/dx9PmmYNUIQCt9iFuz9SbmnqTQ==
X-Gm-Gg: AZFdTZfKukq742cmTc5K1aelRUsHuS2hMkps8QLxchw53LHoOcB9EHHN9dCmE89P6Zr
	795qVevPiaDWGyi8PyjL6Dk480uGHUgPC7rj7wTkuXB5gEWG0mwBo84q0nGFrZuu16JNTnZQuzL
	xvfWdN9lj8gJaYSruUsJfQAA3yqWwp9yBDPR8u3EkK4VtjYKoWtEtdCm5rWVGJaWzD8joGTL1qs
	PP384zgNNrlYnF5bQNCOCyXBRfdE8v3Gt/eXKE+qEBctd7aNXciSGzz/F9nOxburz634ouIUmWh
	uAREF3tk3YPZOY/YKkuk8e9nZ3d5rSmXTlJv3Kwy5UvRFFUIbTIiLNMIGaPHThZvrHceBARPiIt
	AiH/UbIiaIHjJ70ECOCw4KqC87BmHwVce0zWIIVNhEbu9eA60ekhK5HB5xH66ka78hlcMSv0gC5
	Wxu8yW9ZLrr4mLx4EzaMBBOdqw3ch7
X-Received: by 2002:a05:7300:ce11:b0:385:774:fb23 with SMTP id 5a478bee46e88-3856e63b5cdmr20538784eec.6.1795633360963;
        Wed, 25 Nov 2026 11:02:40 -0800 (PST)
X-Received: by 2002:a05:7300:ce11:b0:385:774:fb23 with SMTP id 5a478bee46e88-3856e63b5cdmr20538743eec.6.1795633360093;
        Wed, 25 Nov 2026 11:02:40 -0800 (PST)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm58856227eec.22.2026.11.25.11.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:02:39 -0800 (PST)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:02:25 -0800
Subject: [PATCH wireless-next] wifi: mac80211: allow EMA beacon retrieval
 without MBSSID elements
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
Message-Id: <20261125-ema-v1-1-27706545a94e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMAwB2sC/1WNTQ6CMBCFr2JmbQltAjSuvIdhAdNBxgDVDiCGc
 HcLrty85Mv7W0EoMAlcTisEmlnYDxH0+QTYVsOdFLvIYFKT6zQ1ivpKWWOLokGH1mUQk89ADS/
 Hyg3eHKgjETXQMkL5s2WqH4TjvrQXWpbRh8/xOudH7e9gzpVWGo2xjmrbZHj1Islrqjr0fZ9Eg
 XLbti+j2FP/vgAAAA==
X-Change-ID: 20261002-ema-82877fcdc8d5
To: Johannes Berg <johannes@sipsolutions.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-hardening@vger.kernel.org,
        Aloka Dixit <aloka.dixit@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3NSBTYWx0ZWRfX7pXpZs/NEUrl
 XYuRg/vtP0ekTGKWXLfPyniX36spUk20F+AOHCrBIJyO7LVTLAml7joZOeegIdwNc5rcp4D1u9U
 TT/Tifacf603F+DQktw0Rz//V7gyoo8=
X-Proofpoint-ORIG-GUID: vcHUIjW7dhJ4FcTHNjjGp0JAozptjT8e
X-Proofpoint-GUID: vcHUIjW7dhJ4FcTHNjjGp0JAozptjT8e
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b0730d2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ydX5o1CC2oNq7ZdhnVkA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3NSBTYWx0ZWRfX+20K7LOTRFuR
 xXuWWoNi+QhhcPQ1uz/rcnUyyUA1LHvivFncAzzFuQsrgIpaco0iz+yZNcZFGy5q/H7oKapjp0A
 EqXb+BgsZ++v9BSpNhu87RTheceeC9YPZX3NoYPVxqTmp46MUgTOoVjBUb2Jp5i+50ymRo/Xasm
 4ui9zh0RLWsSmX5FCpk0+HqMkant+SuWlbzsQ9l5JXgMN5bm9D2j8KtlYtB7kTxNXYmRZz2u8x/
 Pn+PE1as/slAUx3wX/AYsvCy/dCCudYyvcgQhEW7TGRenbpsqxKq+eCii/LXAJU5vuh6aNA6wZ8
 noEJUv6q1OSgan+CBIEDKr5O/KVTIzVvwuMjmCDJYZpLixPIQReEQyc0+2X9ySjIo44twoMe430
 w88j34QujePDHYWfIuv68VlMo2lF3EpzsEaP8D6DjRqdD0riqTpXznTzu7QusdjHYCtew8TDiP4
 zAgRTQsVcCAIuWFisjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250075

EMA beacon template retrieval fails when all non-transmitted
profiles are removed because ieee80211_beacon_get_ap_ema_list()
returns an error when 'beacon->mbssid_ies == NULL'.

Modify the function to retrieve the default template even
when no MBSSID elements are present.

Use a separate iterator 'i' for the bcn[] loop and assign
ema->cnt once after allocation, before any bcn[] access.
This ensures correctness if bcn[] is ever annotated
__counted_by(cnt), as the compiler would then require cnt
to reflect the valid array bounds at every point of access.

Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
---
 include/net/mac80211.h |  3 ++-
 net/mac80211/tx.c      | 28 +++++++++++++++++-----------
 2 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index f768ef9184eb..a825801fda50 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -5886,7 +5886,8 @@ struct ieee80211_ema_beacons {
  * This function follows the same rules as ieee80211_beacon_get_template()
  * but allocates and returns a pointer to list of all beacon templates required
  * to cover all profiles in the multiple BSSID set. Each template includes only
- * one multiple BSSID element.
+ * one multiple BSSID element. If no MBSSID elements are present, this function
+ * will return the single default template.
  *
  * Driver must call ieee80211_beacon_free_ema_list() to free the memory.
  *
diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index cb9ecac25a9c..50de2802f451 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -5843,27 +5843,33 @@ ieee80211_beacon_get_ap_ema_list(struct ieee80211_hw *hw,
 				 struct ieee80211_chanctx_conf *chanctx_conf)
 {
 	struct ieee80211_ema_beacons *ema = NULL;
+	u8 cnt, i;
 
-	if (!beacon->mbssid_ies || !beacon->mbssid_ies->cnt)
-		return NULL;
+	if (beacon->mbssid_ies && beacon->mbssid_ies->cnt)
+		cnt = beacon->mbssid_ies->cnt;
+	else
+		cnt = 1;
 
-	ema = kzalloc_flex(*ema, bcn, beacon->mbssid_ies->cnt, GFP_ATOMIC);
+	ema = kzalloc_flex(*ema, bcn, cnt, GFP_ATOMIC);
 	if (!ema)
 		return NULL;
 
-	for (ema->cnt = 0; ema->cnt < beacon->mbssid_ies->cnt; ema->cnt++) {
-		ema->bcn[ema->cnt].skb =
+	/* Set cnt before bcn[] access in case bcn[] gains __counted_by(cnt) */
+	ema->cnt = cnt;
+
+	for (i = 0; i < cnt; i++) {
+		ema->bcn[i].skb =
 			ieee80211_beacon_get_ap(hw, vif, link,
-						&ema->bcn[ema->cnt].offs,
+						&ema->bcn[i].offs,
 						is_template, beacon,
-						chanctx_conf, ema->cnt, NULL);
-		if (!ema->bcn[ema->cnt].skb)
-			break;
+						chanctx_conf, i, NULL);
+		if (!ema->bcn[i].skb)
+			goto free;
 	}
 
-	if (ema->cnt == beacon->mbssid_ies->cnt)
-		return ema;
+	return ema;
 
+free:
 	ieee80211_beacon_free_ema_list(ema);
 	return NULL;
 }

---
base-commit: 18d0bedbb5f0538396cb7f763ed9cd1dd69c5b23
change-id: 20261002-ema-82877fcdc8d5

Best regards,
--  
Aloka Dixit <aloka.dixit@oss.qualcomm.com>

