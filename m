Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164177;
	b=bDoc4MkdpdNU7DAqhAjV8QKfv5qp0Jd+G8YDZUxbddJnMWquu/fMwbtKTA3LBg3l+iMx
	 y3aWrtp1xHkHcGYUAVZu72s1KEUn6urycw+yIU6WDuK5UFpR8HzCWw4Hi0Gn670IhU39c
	 lPx7mcNYmw3sJ9nsm7EVKPn42MUunm7G2t2EZz3wWgzkpnGW7CAThTKzxquiEgOV2/t/8
	 VtCUhdHwmXNIw503Gp6FSdfycoU3i2XWqipT5IE3sg+sw+Yb7rMY5euKgH48KsE/+qgVz
	 gswVpWQZDk99XQVF+Hi38N7AwptiFBFK4YKHMTV3fRwWiwPVAx191Xllp/9BbxgR8kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164177;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Qf5IdZe9V9lj/Vti88O1sFT/iTlv3aw+82lHmjt/bSQ=;
	b=R+syhIbPYXCsHvrVUCPhCDBV8K1diRr7wakMKGjBOim4Wcc5P+YdkNn30+x5VCzuEA/u
	 O1ZmpD7t+DhInxNMnLsSwR8LeYYSfw+vednVYPBvbnIx3OMfzWnY6xJc9BPT6kJUqFjpV
	 RB8QW5KVDJa/ptVhDpk36/Tgl6Opwnxzvlex80lYYWbq9kfdCmltxAWJB/WXftM87M7E3
	 nj7XempncokIYsuZLqWaVwy0sR/+BhzVRBx0bU2iCnO870s1b3H6yEJvzkHuHw20m2DyP
	 Cnp9cl4UFQJ72F+BIQFhIzOB+pjrLzTsMpuHPswP9dlwHxPh/nxhhwrGsrt6zjDoCtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lYgF6jey;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SAOxmyeo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D56D606A8A1
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D56D606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lYgF6jey;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SAOxmyeo
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7euKW1048853
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qf5IdZe9V9lj/Vti88O1sFT/iTlv3aw+82lHmjt/bSQ=; b=lYgF6jey/rig4Urv
	GY+9Lr0ki79lxAKj8asHI3OSSS+I/Pj9saK+p4wIwaa/9bOlmiZXFfurGM4RnGbb
	rxmktM1gWl/6n2j+LkveMLd6nPzJ+xbZ2YwFKq6yjrJdCQRx1I1ymrGR16TiLb48
	wPzMTKsd+JHjOfvsu29pFMkz6JmCUrYkqW+SzyJyrtUEnQIhZXo6kz7X9AE+xCLU
	rZB23c/OyE1u2EVMqnQPTqT2+DHYk2Ewj1uxZCVvpWfGTVCUthkcP4c3pFWOuQma
	ovWAt4vZkaGiMZ42U5nDrD6xr1xlaUrobBmnDm3h9CXK6mAmYmV9zO0KaKHNqKVb
	9lAQIQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guagjw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:42:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-383ec96a7deso714621eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 00:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164176; x=1795768976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qf5IdZe9V9lj/Vti88O1sFT/iTlv3aw+82lHmjt/bSQ=;
        b=SAOxmyeoINbyNQT4O1znpTNW8IXq22NbJfTboPRCCJCNiseQ2elrRusTTsxrBGlsO7
         qA8kLGGJiEMbJWKfoqxRQ0FoNbBLIhldieKiAhVzmujFSOx3AxKfoWZyIpFDEK7xYFcI
         qYsGLygy6/uenBZZ92aHjlbbwSoh8BNa/qSiD4JMhs/98UPf1qixZ94JdNAnsdf7G4ZZ
         jGqBHYyd8pZSwVLlmQQ3PRllp+Xoa3/qZAW/18npFt73ze25rCmAcRIL6GT+iFmpIkad
         JHeR1dPNcxEHlBK4NZGpK0BorGoe0QqWnML2Uw70EEhuhwVwY2C3rlEdQW4C6GnklY2+
         wtww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164176; x=1795768976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qf5IdZe9V9lj/Vti88O1sFT/iTlv3aw+82lHmjt/bSQ=;
        b=zg270K5GYAqzZ9tTljpE7M/CAzOcRp9aKMjM17YnXcO562gZisvDzOuhOS3/4ywvOK
         6Z+nKEJPduTLFBaZe/x7RVr2CZvvwLRaoPQdaCQzspVPXfkYZa1Pi0hXe/7ftFdq2Xtv
         WHOaFEueJtX4VLLs58TZTGGE1iyRL4ZYQUxQN4s00ymx38bhADjdidp6HDtzl01HE682
         JZNlTwG4ZsZhNZ7053dSXkgMa5PEvDZfXyE7I81oiZRb3Y59GWTbkb2fZ8Y8H7QyS4Sn
         4csKwZ7fIslUCBYU9lchHv61JN2aIjh57sRhMfPWs/aDyBtQs6QpQHXSjJ0D4P67kwDA
         cAhw==
X-Forwarded-Encrypted: i=1; AL+hErElxKWHYqRQ9c+LmZ7brMPLRyNhtLVAJ2bpAtGMRLWYpGEFfyspRpwWfYXHumEUAfftdDRxsdYtyF+3Rz2oRA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/MUvze2S9ohSAOfxe2+hOIT7wzW5lkKkeo7uFvpoSg3RJsZVs/
	KFZ5VyqmWpprniKvoHiz3tLeGlSiwse+0fI89lhnzMhec5uuKgnUXmXZnyjnFoxUlJKOt818+yk
	MgImIqaRSThVfRLXap/qsupWmZKCX2U73TOe08SBGceW4x1LAyN/VhEeW3vhbX/vsHQhu8A==
X-Gm-Gg: AZFdTZfjokmF4QXoVSpCkW/4Uy4xHrqultxdqRspGDo0dcZfKGJg3zmoqNmPCVdOWUq
	y+kId5BTrUtUc/rjbWb6dTqUSCaFHVleuZCTJjbtwI7+kA7XlCOcBL4WHVWX0tuYIKCxYhSMbIK
	wzGAKob0Ay62EddNYKDeKV6ROc8+S6hPoZYsiCVL5K0oaY1VIt/2DvUyhG+1gxdvDAadrj0SCaw
	UWjJ2HljicQxaQajtaNetL9xWBuAug7XV7QPH24AzEZs7XDA7TaUMKhZEzs+jry0DntuMlvshQN
	eVSmMCr+EfoyB7VNPC7wzCezYYXLKd4DQnx4l4kJyH3b9LAzehHvHlDRYRceS8IhjkE2tcYqSBz
	KrYn3hJp6/RdsTsZvdIXyEHaLd9FsmCG03amm4n1HjGoK0t5UGIoH5vONnDh/6MpOEza3X6CI1l
	fpIScounwYDig1RB/x9XlsdiA=
X-Received: by 2002:a05:7301:6484:b0:370:121a:b2f with SMTP id 5a478bee46e88-3856f65ad8amr1904454eec.11.1795164175763;
        Fri, 20 Nov 2026 00:42:55 -0800 (PST)
X-Received: by 2002:a05:7301:6484:b0:370:121a:b2f with SMTP id 5a478bee46e88-3856f65ad8amr1904427eec.11.1795164175206;
        Fri, 20 Nov 2026 00:42:55 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm7326352eec.5.2026.11.20.00.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:42:54 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 00:41:28 -0800
Subject: [PATCH ath-next v4 03/10] wifi: ath10k: wake blocked waiters when
 entering WEDGED state
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
Message-Id: <20261120-recovery-v4-v4-3-53d6a04490e0@oss.qualcomm.com>
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164171; l=4095;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=Ffcymno37RuIQ6A3MjiQY7jG8BEb1dkThzhiZcss1GY=;
 b=GTTjHvDc89GeAUDj0QE8VC91UTb8z1BgeAf1eIzOBCv+Wyw7C+t/AB7fLmcvyJ99oZEbRS72z
 Seshg7G1fMGBE27FRAFYs6fwXlinLugEcDb+gbLfj0gC9w6sus5Y9Uc
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX9E6LMGcigHcA
 5xzKlc/sXzGrLYwXVOTdDmkO4fs+DmMiWZWCKw5SFnsoGSdCjSb+fEgFPNKo6rVlh1KbC+zsdbY
 B4zlO3sngosDuS5ntya8sRGXm+jjYgwtzmHq6KnM57WjrCZvh0OYCRWA2rlmcX7GC9LxzjTrcr2
 wpGdCTSDauNBsiIltDbLicrkYzhDRSnH0kuOMb91W7yBKhjjzZTNCO/hn+t6R7vKAdjvM7KI8J/
 4Weze5yu2HLPUvEzrH7RQknL3cTJTqffQzVTcTNsZN6Z9A7Edhp28S+beRqY35ibXSJvP6Ok0kn
 Q6ldnp1HB4Zhvk4Ggx7zoh6NXNtu3MhoFx4Y3eUi4zUXEEh+sluVXq7ap/cMrSCFAC3gQJRiTuZ
 u4xVIpyj39vwOKx6IafLIs1UP6i4uNr0miMNA2GoUjQevRpyYHKZ089l5ZUY9Ul3cRFnJodILFK
 iFoqwIItVRsQkzcsy3g==
X-Proofpoint-ORIG-GUID: SeaqS_qdDm_0VpLffTwJ0jVZBojvM1Ym
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b000810 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6QK6Bl5UZFK8huMW9Y4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: SeaqS_qdDm_0VpLffTwJ0jVZBojvM1Ym
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfXyijVjzJ60P9Q
 tPANVvjS8mqovh5Ttq/Lpcx4l3VmvUMh8C5NfWS71MUqYeCX3zVyS36+rRXI4NvZEwNQJ2G+/V9
 on31+TV8KBlpk+toe3jELKQnTrtCICA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200034

Commit c256a94d1b1b ("wifi: ath10k: shutdown driver when
hardware is unreliable") added a fail-count based transition
to ATH10K_STATE_WEDGED after repeated recovery failures.

When recovery starts, ath10k_core_restart() sets
ATH10K_FLAG_CRASH_FLUSH and wakes waiters already blocked at
the time the failure is detected. However, additional waits
may be created later while the recovery attempt is still in
progress.

If recovery ultimately fails and the device transitions to
ATH10K_STATE_WEDGED, those later waiters continue sleeping
until their individual timeouts expire even though no further
progress is possible.

On suspend/resume, these extra wait timeouts consume watchdog
budget. Crash logs show cases where one or two such timeouts
are enough to cause the suspend watchdog to fire before the
driver finishes shutting down.

Apply the same CRASH_FLUSH, queue-stop and waiter wakeup
handling when entering ATH10K_STATE_WEDGED so blocked callers
fail immediately once the driver gives up.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Fixes: c256a94d1b1b ("wifi: ath10k: shutdown driver when hardware is unreliable")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 43 +++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index b536c21630b1..3bb4d2742c30 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2533,6 +2533,32 @@ static int ath10k_init_hw_params(struct ath10k *ar)
 	return 0;
 }
 
+static void ath10k_core_wake_all_waiters(struct ath10k *ar)
+{
+	complete(&ar->scan.started);
+	complete(&ar->scan.completed);
+	complete(&ar->scan.on_channel);
+	complete(&ar->offchan_tx_completed);
+	complete(&ar->install_key_done);
+	complete(&ar->vdev_setup_done);
+	complete(&ar->vdev_delete_done);
+	complete(&ar->thermal.wmi_sync);
+	complete(&ar->bss_survey_done);
+	wake_up(&ar->htt.empty_tx_wq);
+	wake_up(&ar->wmi.tx_credits_wq);
+	wake_up(&ar->peer_mapping_wq);
+}
+
+static void ath10k_core_enter_wedged(struct ath10k *ar)
+{
+	ar->state = ATH10K_STATE_WEDGED;
+
+	set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
+
+	ieee80211_stop_queues(ar->hw);
+	ath10k_core_wake_all_waiters(ar);
+}
+
 static void ath10k_core_recovery_check_work(struct work_struct *work)
 {
 	struct ath10k *ar = container_of(work, struct ath10k,
@@ -2551,7 +2577,7 @@ static void ath10k_core_recovery_check_work(struct work_struct *work)
 
 	ath10k_err(ar, "recovery did not complete in %u ms, will shutdown driver!\n",
 		   jiffies_to_msecs(ATH10K_RECOVERY_TIMEOUT_HZ));
-	ar->state = ATH10K_STATE_WEDGED;
+	ath10k_core_enter_wedged(ar);
 }
 
 void ath10k_core_start_recovery(struct ath10k *ar)
@@ -2618,18 +2644,7 @@ static void ath10k_core_restart(struct work_struct *work)
 
 	ieee80211_stop_queues(ar->hw);
 	ath10k_drain_tx(ar);
-	complete(&ar->scan.started);
-	complete(&ar->scan.completed);
-	complete(&ar->scan.on_channel);
-	complete(&ar->offchan_tx_completed);
-	complete(&ar->install_key_done);
-	complete(&ar->vdev_setup_done);
-	complete(&ar->vdev_delete_done);
-	complete(&ar->thermal.wmi_sync);
-	complete(&ar->bss_survey_done);
-	wake_up(&ar->htt.empty_tx_wq);
-	wake_up(&ar->wmi.tx_credits_wq);
-	wake_up(&ar->peer_mapping_wq);
+	ath10k_core_wake_all_waiters(ar);
 
 	/* TODO: We can have one instance of cancelling coverage_class_work by
 	 * moving it to ath10k_halt(), so that both stop() and restart() would
@@ -2664,7 +2679,7 @@ static void ath10k_core_restart(struct work_struct *work)
 		/* hw restart might be requested from multiple places */
 		break;
 	case ATH10K_STATE_RESTARTED:
-		ar->state = ATH10K_STATE_WEDGED;
+		ath10k_core_enter_wedged(ar);
 		fallthrough;
 	case ATH10K_STATE_WEDGED:
 		ath10k_warn(ar, "device is wedged, will not restart\n");

-- 
2.34.1

