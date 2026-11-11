Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412206;
	b=zNvH4vchNr0BxlvKUEwIUQtKB9OGP2WIrXmwF8L3QTorLWzjlUyfLbIYaUpfDIDnm3e7
	 m/J5U29oEEGvJnvj6BCNN06mLi4ZVSuzA41lGcFBFebhiLq1vZsLUW5SFpR7iNQbO04ev
	 utkOjzmR6Ue1EtMomx6/tH/Ylr4I8KPBC+D0L12vX8R+mvF9Y/BmWOU7a1g3+PfhBiHLY
	 5ko8zU/E0VyFK1gm0S2CFeEDM2wwJm3oMN++5eM1+e5TLEAORq7la1D5sU0FTAMwnEpFl
	 0CJffCJp1ppfMLTA0buNfmxDJp26kWHPRtfREaMe7rsl3uoA/vE0tqdgUjc7D7J7GQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412206;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0RJPk8SLvdkt3fyzqaAjIp4rjtW5BHhAxUCLmiMdDNw=;
	b=VFumt17aJmtotjFtbH8spt2nNX49B+PAdQ+JLOcNuvZ19ywGB3lisbiNfZxJrGdFqenN
	 6i/Oy6/sWVkKyg/9+y/UGxkyDO2hccQPgXWXsr0Qd8t12338azRBbAu+V8W8jvnRL9Y8E
	 JTf3t2n4PcQFTJQffxE3VQ5YKzj5KZn/8MIoWNlYcRkUMYJ6RqF1IGXHJPVBVDof9CFsK
	 Ou5FvfC9ukU1fF3LfaE3Yj5OUQMgXBp+I0y3bA6jPRLRGYxx0EEVx8uq7BAvoSkxh2ZCh
	 fk51DxwkAk1lrp6TsfR7vgaSpgHqdUaXUpsMdpPONVGeuyeOwZXjOFoUSAKxj+r8gDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OWAaoHof;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="H/VZNJz1";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931B3606A333
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 15:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 931B3606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OWAaoHof;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H/VZNJz1
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0CKk618035
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 15:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0RJPk8SLvdkt3fyzqaAjIp4rjtW5BHhAxUCLmiMdDNw=; b=OWAaoHofESkKqYr+
	QQUiSamKGhM2wrRfgJs0QpvyHxK2Wit4dMv+6UN4ducnucnX8oNxnQdI9jUlEwgU
	TEeaEqB9q17laLLJY+Dsm/HRA2DKPSqLdRTMM45EDdUb5dY0otEIaWFa57O/62d2
	5ZgUdQo7F6t1TfAPp/RI0jqo88sLK/ozc3JbKJObUYdGqx+sEAV0ap/6rUOcFaR3
	Fg9DEAQ3gW41Xyr46hfbkOGzKdkOZ7HIPvk+KKxwG1X/saXkjUweFRCFsNY1Tpsc
	gwjx082OHKhVxI4Fl+690P5ZbfzJYhI5rM7lGHzn/pbGmQpcCTswDUaGs0321LIq
	X/csBA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvpjjscja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 15:50:04 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-37628596fc9so16594eec.0
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 07:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794412203; x=1795017003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0RJPk8SLvdkt3fyzqaAjIp4rjtW5BHhAxUCLmiMdDNw=;
        b=H/VZNJz1W26SZ3mJi7LY8NraZyTMAa+MRldSV18pGas7/JY1cuYmMEMSuOY1fpvlJV
         LkYzFvhi83d6A5w6/cWLCTm+PctPQegMJWIPYav9/vyMh3dMzJlcQIMPS+3XXiZgSiy4
         n9VGoEOvhPiDtqv3LQx9TEFKEO/qtJ1eE+GUD5x866Cu6Fa2uiEsV0ciSToH8Wkvr7Ql
         EJN4vwI18iJ+adGVCjrFod290oE4+ADGRerv9NbjLb71jwHilZzZ5caIzVTzu8SpbrIp
         EdAYgIwjTrapfnom7guqySHiYttv7eFVYB+fWWHgv0KTDatHJRJ4TAe9qoxXq8wH3rsd
         5K6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412203; x=1795017003;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0RJPk8SLvdkt3fyzqaAjIp4rjtW5BHhAxUCLmiMdDNw=;
        b=qdFJ/8ZXlQqOcmy0KIENqRUWl2WJz+8I8YVy5JgTovYBmU9jeJwpHF1t73TXpZJGdV
         5zwz2mmDlK75bc+YztW/jqe10yvRlf8SocLcWTQGOOD4X6+B5W3N8Q5wHPDWU33EpXLm
         Mk5MmGX/3Rs15rwiOC5crB4EAKpx8tJ7i0kgmQrwp9V/CihcTD2TvPq8/zhnppg1IegX
         70856ncviSz3bExqAX6S0fUqMYof+NR6J3qACNG8rl8LakQStvXvWeY83Mdmsxy9ZHT1
         vOklHZhXIlH26c+z/TEr6inzPBZoOLcL+aBfJ5kZT1/5XykTEi1cd5pDbEKB4OpyDdgK
         yFew==
X-Gm-Message-State: APuU4Z9bII6D3JyhX7cq3qthTMXFrLsDIBUc2fi1w1d7n7Ir7N2nLZof
	AMpXyQvBzlA11/oj/yAkJsqXdrum8tdUyrdtI1HI3pnW0fCoHC3lyBByStub0pew6T/DTUwKr4E
	i06bRN3eP6ISMO86YuHydWSAYuTCEkxND6Sr5vJX8kPuAI+3K+bksuCiV6f/huROpfIKuVw==
X-Gm-Gg: AYBFou3HSDqEuxMMB1fRbdxXz1K1yvelvZGIafn41B/0c7UPJlm8fzJaPNlzin+pLsy
	4qFOlQYYXZX1UsiDVquu23d98+c58J1jIzdM/xIAEWj8FLoW00qry1FxRiqaJDTguht5okAAs3s
	UXOnWTCR4fXx+toyFimqKzW73A+TnE3FyvIX0I98zEquu1eUTAwh0E2WdCh2Pt/wR+BASGrEqPX
	68mh1L8MRjnEb9K9ZEbMT2zzqZCRF2viU6tuNLhEfbfSi5OfD1KREnqmvncssmgzp3mEol13od7
	bfkmdm9eGfcDHnY6g2zYwhhmHhq9QeI5BlEWYCzlB25ffmJTRdCEj13YSUGTdQYGfDZ3L/i/vdF
	hK6D8N4koHYfhFUnMdOkCvi5DQuyUiRXLIJhKlRsDQVOGdhEytZAV/5F3z/ee+y8LePBwzYbKuT
	mZv4am7qlgLGwU4FnesgGG8W3PEHM=
X-Received: by 2002:a05:7300:8345:b0:362:fa87:2aa6 with SMTP id 5a478bee46e88-3768076cbc1mr3090680eec.0.1794412198400;
        Wed, 11 Nov 2026 07:49:58 -0800 (PST)
X-Received: by 2002:a05:7300:8345:b0:362:fa87:2aa6 with SMTP id 5a478bee46e88-3768076cbc1mr3090657eec.0.1794412197707;
        Wed, 11 Nov 2026 07:49:57 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c7c50sm33704924eec.29.2026.11.11.07.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:49:57 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Burke Cates <burke.cates@gmail.com>
In-Reply-To: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
References: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v5 00/11] wifi: ath12k: resolve RX link id via
 logical link id on WCN7850/QCC2072
Message-Id: <179441219693.2984996.8197765482872032821.b4-ty@b4>
Date: Wed, 11 Nov 2026 07:49:56 -0800
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
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MyBTYWx0ZWRfXxXw1HSaijrLq
 dEpDcD0F7wMx5ZxvF+VAm2CW6MKn6Rqg26NggwGUV6RP5dNpBftLWUgtrfDLG67oWMFY3WBkiyQ
 YHl610anUtHcjFGkDLzWrYA5o60z6sQJZf1/1XGL6oHA3BA5s2sKYhf9kHdgnsNAeETs7QoLV+7
 XKzaxduCk+hKshyIk2WKg2Odn8d0A/Z1RlaXAUExvgy/GstM7b3PRNzrP//EP02tnKYAru5if8e
 4mBfGCh1TC7Fa/6wq4fuK4ykJU5BbMGGmhJIoIZtGfQl7GALYlQBMdCjOLdRqM6FHZ5mOnvEoat
 MfaH63bMKlaTgNK5KZ8mdZh0vX7RO5rv8J0gzA/RYKB6IKgv+IajSFg1ipEXgJctEQLqAkby7Mf
 2Kj/h2nfgoEMw3MtTfaTPmJwLla6obPB6ziyWfMSB9wYDJ5tgfV7Bj6BJXZVy1OVi1UZE6mIFxh
 oIgOdvoukFUb0XIl/Hw==
X-Proofpoint-ORIG-GUID: knl6d2W-wotm1bhOsldr22SueegtO2el
X-Authority-Analysis: v=2.4 cv=FeuiV5+6 c=1 sm=1 tr=0 ts=6af48eac cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=NfwiDt4suf8GamiR3usA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: knl6d2W-wotm1bhOsldr22SueegtO2el
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MyBTYWx0ZWRfX6EnYqb6CnjZZ
 Dv99GbUg3axXSj6qheeBleLGHr1rm+NlrGPzx6ZhVnu03RQGNXSvYTeIKT0avi4+Up86H4lEkkO
 STv5nCeAmkBw+KuckMUUPGaVwbdLKnk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110063


On Tue, 10 Nov 2026 14:40:21 +0800, Baochen Qiang wrote:
> ath12k currently relies on hardware link id to resolve the link peer. This
> works for QCN9274, IPQ5332 and IPQ5424 but breaks WCN7850/QCC2072 which use
> logical link id instead. Commit a2fe9dc70f3b ("wifi: ath12k: Fix low MLO RX
> throughput on WCN7850") tries to fix it using peer_id but actually that fix
> doesn't work always. From user PoV, current code has datapath issues like
> EAPOL frames getting dropped on QCC2072, and finally MLO connection failes.
> 
> [...]

Applied, thanks!

[01/11] wifi: ath12k: fix potential OOB access due to unverified hardware link id
        commit: d709315edda1fe0742e1178a6085e1db69416af3
[02/11] wifi: ath12k: skip hw link id match for devices without hw link id support
        commit: 43c38c0b197818dd40082adf4348f8ea75fad338
[03/11] wifi: ath12k: rename ath12k_dp_peer::hw_links to link_id_map
        commit: a83edfa5f4942b61aa4f268830a214cc79d41b9c
[04/11] wifi: ath12k: rename ath12k_dp_link_peer::hw_link_id to drv_link_id
        commit: 6a87f77b0e83dbbf3e4de6c5433b91890f6cea60
[05/11] wifi: ath12k: rename ath12k_skb_rxcb::hw_link_id to drv_link_id
        commit: 19e67969fe60006503d90fa6f5112f7194e65a59
[06/11] wifi: ath12k: derive device id without drv_link_id for single device group
        commit: 97be8e94bda1545424ab6e169683934e97528c56
[07/11] wifi: ath12k: add support for HTT_T2H_MSG_TYPE_PEER_EXTENDED event
        commit: 33022996c0388876a5f2a484b25014b61c63e415
[08/11] wifi: ath12k: allocate logical link id on host when firmware does not report it
        commit: 71d642bf03856723b1c16757471d7873e561d4c8
[09/11] wifi: ath12k: derive REO RX drv_link_id per device via HAL ops
        commit: 050f149c9ec26dc9f90c83940fb6561a06b3203b
[10/11] wifi: ath12k: derive WBM RX drv_link_id per device via HAL ops
        commit: 1828f610802dc5aa9ac0eb40477a806cb02215c6
[11/11] wifi: ath12k: use link_id_map to resolve RX link id for all devices
        commit: 9347a4fc49f3cba3e458e4a9a3fb26e364af2b54

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

