Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795713560;
	b=jgWP3mFn/ynKVHyplIsy1uE3IzksjpKAF+k0rcVZWqQXa+oaeRkyTzch3wXTOCDWZWD4
	 r1MwCpQ5Ny29eDpr7zTVxuEtLDRIal0rh0syJLodF0giaKTIfoU+HyoX8oHMt6qQ0+jad
	 Nc3QxpezONh4UaTooD5ZTQf5j0dXtd8fawBrOoZ2FyNJxMKns1DZlTdFkanwpJ2RiHbHW
	 Y72o7E2flmn7KdMSi49W3DgD0T1tcWf47uQBwlMmlCsk+EuV2zi0tCuMgH05Yb1AekG+o
	 iSUNehNIPQ3LYUqjbmFJawEZMoi7rjCg7GLWnD68C7AoP7nLoQEHlHC3UdKUoaxrSzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713560;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bs5jMyXnZM7s0Qp0fBgrluH7PEzISZaX9fcL9jD/AIs=;
	b=AIK4RxM47k9sOSUOXDJMFds7ZKnIRZGjvq2p759O/gv10IV1cdcpgByVBoPFHqLaKIUg
	 v3cwCstFV0XzwOTy3kQMxjIo0LEcRt0/Xyy+3HeQ69FK0IsVCpTeGN/AHHNf8SG9zqaf6
	 BHh57iva/l+h7RKIqR1Vd8Czp4aY2jvLFqqnVA1Lh1gxUn2E8L20OOEywHoP6qDGr5IUW
	 OCuMedcOg82VRz6YfUukMu55Sm2Ec2msUeBDRlWGs3IOkwmCHznKAf74HGaz9JReW9Ngi
	 O8ScwTmOMnkM9i9WWkoVhUOGw9m10QZax2gxsBJ5UwnUCg//FcoQ+3cjaAk6aO7Nl7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BKMreOhp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="kn8Fblt/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7425606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 17:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7425606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BKMreOhp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kn8Fblt/
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFvFsr1208553
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 17:19:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bs5jMyXnZM7s0Qp0fBgrluH7PEzISZaX9fcL9jD/AIs=; b=BKMreOhpo5J6OZNA
	DmwzO0JZ8RxRW/8sMUNzqxURtPM29bCZjP03Fm4+0T5cK181ysFoW3aJIVs8zX/C
	K1Q8iq6LBGc64O+OBy3AWPc+hG/Z28XCLgwpy38mE6eBSYwCsBwwbd3u8m1Bt0+a
	EEACRpBb4TfV/gEA+qSb4aRmk63lp/0YBoYSUh3x4W8MpqGnI5uJrECR0PMLH/9D
	H3vDDSqTD/YTk3sawNapRXvKkqd34y/Z3yusQpwz1Wq7Sx/1M2xfnZ57dnz8wHLr
	aGLaQ2cdacezlCzTghJjZO4RZML6YLapPpBZ7U9+me0zXVHWxvibKci3DByEpVrs
	O4phlA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6gne21jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 17:19:18 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so2796325c88.0
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 09:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795713557; x=1796318357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bs5jMyXnZM7s0Qp0fBgrluH7PEzISZaX9fcL9jD/AIs=;
        b=kn8Fblt/VoXjYTz3T6MRijq98q4D1bpEIcvl3tkqiP6zDESNIcvPiynV+m1RkbYKBE
         bf0DAqtwZyBN6F7kuG7L4SJz6Id+feQrnDuo90krGIdx3ci05mNHyCBXu3VmO/TX0dZl
         +7rr/TouIKaOhHVE7n2bAz3osoDChvry+3KJPjPEYwXPTPEJh4uYIDNroUPtI6GNEGAV
         TU0slowlvu1JbDkJuA3ACAjVi/QQNy5Pdpjm0gC0Jt5zLh1ULohGZuZwrqHKvI3ijjX5
         NX0amW8coXYZUBeK/b4p2X5r8jpsxPMNaYOs9KlJZ3BOwoYrRlTQDwuJNxfPFNJLDaef
         igqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795713557; x=1796318357;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bs5jMyXnZM7s0Qp0fBgrluH7PEzISZaX9fcL9jD/AIs=;
        b=GPWO6V7ayDOdnOf9lIfzPYHHUXUsaMGXFlIPm+nXpJXdDxUrHT8aW1vkqi/7Onv9Zu
         76UIzXFEaVzJLn7Ln1dSNY3p0/Q2gwoWk4ACCja0DVWwKuuAFx/NwgkV9AR7UaNc+6uz
         SUHC+FXSS5Ol/6ervJNswsNazQ164gWG0X1aZtZWkZqXutVrRGp0yjxU13urTJOb8+9q
         MS7mpw+qOB0ukQnzn8LJO3q+ipjifvwg/A7WYlx4zuCHLSaGz0xB8A+Rtf9G66hO/nuM
         lsyDH7DFw+aNHVFOInj/DQvTZApB2taXtZe9vYBNZU9QMWuEuf8Eb3WjaD5ZFKl9y1z6
         6MSg==
X-Forwarded-Encrypted: i=1; AL+hErHogEynTJ/ZDfD93mIbZOWQ08Lgp0vFbQEhP+u1HO+hOIX92CPmCYfiVppF94DHU3Rid+VHoyjvZl4EifNI0A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/POUkXnqTjbBp/IzZB6iBPLSM5oZevzKwDsJZFiOC1j/p2EHC4
	WTuCEHN4d/6ghMOUqpyZu8q1kbgo3ToG1wkDfmZTJUVUyKjK2xBcE12LbzouTuCjG+QiYH9QX40
	qvaeRM55D8plgLLjgJfW/Khq07lxgYVO9hD8VEIO2iUx9oMHHEeNuuxmUcw1vCPu38v2Oig==
X-Gm-Gg: AZFdTZcn+SEc3iSDTO9DS/OBVlmiRTIzW+OTHKDpWdJlYUWT9N2pgBxUF3dBXUGRMiv
	dm4HAoB8G1MewDC/hhBDPi8XVFMm0VcozDNbq0BRTgrNfqDicwTeyd0wskc3blYxi+OIwwsBogC
	ZyIYopIHe80DmhSC6vq+BWSuT4S8/+u2SBj9qyeDRSSKeG3Alw1HkjDh2EjRNPlDpOUEsQLBWN4
	Eq+nJixUmnyZam/Vy6hhVqwr4Vr95/63LUnp9lN5gaJnIqBnen2RblQL+Atvs/Y/GDdRysdo3Z6
	rBD1byky6aOY8mEmZeThSxUTr5mXqjtnVkOlkSDcHzkwdRAkTikF0bGchb506SxELQSQGOGQycK
	Xfbzbj1dY3jmmqDnqv5PVSrC9KidNIZGLsSuxWU012dIh2kbVoSOJbsPVn9WVMazE6vRZ3CvkJ/
	HPJe0lr8nXMiYeX5bDkw==
X-Received: by 2002:a05:7022:3b8e:b0:1b5:32d7:7d73 with SMTP id a92af1059eb24-1b5568f3283mr26336566c88.30.1795713557286;
        Thu, 26 Nov 2026 09:19:17 -0800 (PST)
X-Received: by 2002:a05:7022:3b8e:b0:1b5:32d7:7d73 with SMTP id a92af1059eb24-1b5568f3283mr26336527c88.30.1795713556648;
        Thu, 26 Nov 2026 09:19:16 -0800 (PST)
Received: from [192.168.0.3] ([49.204.130.51])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm57578044c88.6.2026.11.26.09.19.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 09:19:16 -0800 (PST)
Message-ID: <d529d96d-ad34-4768-9135-f3909f9e6476@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 22:49:11 +0530
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
Subject: Re: [PATCH ath-current] wifi: ath12k: fix DP used for WBM error
 buffer refill
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261017-ath12k_wifi7_dp_rx_process_wbm_err-fix-dp-replenish-v1-1-21eff2270080@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20261017-ath12k_wifi7_dp_rx_process_wbm_err-fix-dp-replenish-v1-1-21eff2270080@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XpVvqlF9 c=1 sm=1 tr=0 ts=6b086a16 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JcMdxy0ByqZMvlM8ZepLMg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=BMu-IVq0bH7Oa2EsFFQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2NyBTYWx0ZWRfXygMgzAPcI7Vl
 aNf0NB7ZgK60KdzxESrPDK4uI0q51ugzsreJo50Zfi1cTVO525UM9zhUC5b7QpKwjnHzPBNy6zA
 izkaEeALzVMDW81umc3+NcO6tcME8AU3bsuXyxcsPRHOrpNleIq3eMkWf3DJthJRDlYMYdT9QUh
 QehHDqYiZ0wYOs0kQIlRhDDqxhyCxnEg3RZsInqSRqLwsRAF5saE8N72jHlwxFk1dVM78git3Qy
 1s3UeURDscYVBgTPzp9dyE+x63tbBmVQ+SsWAMwl7DgAcHz7SSXC47PUvCPKO34+PYmIJr+7BzY
 bSW6gDLnhXo0zXtyZA5bNZZfT/VlK8JdZLxcH5kpprhIZrJ6l26FTSobyCFUYUkiC+HL4CGPumX
 pr8Eo/YL2Ewx4fkDrunBSFnWzb9LslTiyhxkTHj+V3avtBpYRcI7NDTOdckFWgySss2P8UhJ0oU
 uq00bx7mdFLiygRo97g==
X-Proofpoint-GUID: gyiDRAWbzQBJxIyzpB1K8XVHNwFFzq4A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2NyBTYWx0ZWRfX9YddkJYVLqKN
 BoB1hQZAGIzSXS8OyBJMfDXv+nilAJT78JlCulhHEBrhv9/EYU0iy0iuIc5XcAcIxsCPSFUjbcR
 BLqHcbOPfyRiNN3L4OeUKB+gGjxPb8U=
X-Proofpoint-ORIG-GUID: gyiDRAWbzQBJxIyzpB1K8XVHNwFFzq4A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260067



On 17-10-2026 15:06, Lorenzo Bianconi wrote:
> ath12k_wifi7_dp_rx_process_wbm_err() replenishes RX buffers belonging to a
> partner device, but passes the current device's DP object while using the
> partner device's refill ring. This can map replacement buffers with the
> wrong DMA device and access the wrong RX descriptor state in multi-device
> setups. Use the partner device's DP object consistently when replenishing
> its RX buffers.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: 1d18b197bc4b ("wifi: ath12k: add partner device buffer support in receive data path")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

