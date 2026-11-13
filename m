Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794562854;
	b=rKpZXrKm9do+47ovB+31P0NbWBgFv9PzCnM1kU670v2yfGPlRMPwrayqw/2Mxba1mxsl
	 TX1DDw7YeREbRyNEWjBSU6hNCKKztocCTELRoGEAOaGInL57Vl7euniamzBdAbVabT4Q5
	 tAq2/HqHrceZ5Fa00o/6H0AsA8NSKImdFjE52t28EXOPM0khlo5oUHisl4E0rwoEJVIKe
	 2Bcr+Rs91qdW07A+NolMnk/lU0cJ7iWmJcyUomZ8zDDp4X9OIXDVVs299vzBpyW0gGLjv
	 aWSPNL2jafe4MADI0kZE2U/8cwO4aKVVQ/Wx+zrDfGiLyhQYdvQdRP9+Fqt6Uhmj55g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562854;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VnPGdyzEVlios+LG3+SMJVHhVByrNg1HzWkI/GkmuZU=;
	b=3HUgFsNYxslN/jcPbru3nOL/rDKATzFGXw7v+8Q5/7ApNFtcBIhmcBlBHHoEzYUWgptG
	 Wigk7JTPINeBqeacJYiKsjSi5zKdv9SO6XHSS9RYjKCGxof13DO5mpERZz+IIauUr0hzI
	 u9PhXgCb2SrZfz0Ivk3qWgk4iTjOW08s/Bjjxdf9ZHjJz1OWGE+uuvB72YhZthnwLmhUV
	 5oiR6xFuOT3wi6ozMLPSjsdZPQ+FrR/CA2ZEj1/j0pd6cmvD1uSrzsgEVq+8ylWdrLZ/5
	 LZgy6253eQ4M3aROt8Tl8F+F/fU+UBTJbnRlGwQVHJeqoBiIvcKcJjFWh+G3Pr8BxEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="OwN1/M4Y";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dOrlXi+3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFB1606A321
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 09:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FFB1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OwN1/M4Y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dOrlXi+3
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VDcU3652963
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 09:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VnPGdyzEVlios+LG3+SMJVHhVByrNg1HzWkI/GkmuZU=; b=OwN1/M4YDae6Mh1n
	t1kPuMJtk04rEe8lVDx9PYrDxOmtFrGCAyq9h6ciAoc6jsMAhX8v/BemYK2Yhtla
	qK0jwA/TsfdyVLCdEP3NmHGc39YwsNmRGLqL5QQEoL8qwwbsOD07viyDs9GiNKwz
	LriFTHwoZNG2noQF55hnFAiReTka+/Bse4EBSXW24FfOkYWyofUm5bX73BEVlGeF
	gtUawsT40238X3FNzuk/g086zRXERkYvWDESKxcZywQCdGI0Y51RuObfHXUyZSDZ
	xYQ8AATMAlTry8el9nNg6spo2mzblvxf+mdLvAdt6L+kxNl1dWjDPEsbVpwYXtBd
	mc7EKQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwae7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 09:40:52 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91f0938c499so1894796d6.2
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 01:40:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794562851; cv=none;
        d=google.com; s=arc-20260327;
        b=Pb/P7KQPxCMLbIHZOPUGxc1ujor/IgqPULV0jvuUvJ+dd6uC3y5F9apRLmn4DjVoO+
         REmE7qY6VVEVqOmNIyNSbx4o8Gb1i6KI7AKS5HcahBRDks9cWOeB+D7jX3l/VdlLXQ9Z
         ukC2jSmtAJsUQCbss+gT7zhpO+N2MzdjJXAlzT/W7T0vmJZZx0JTtUi+wmHpXitlX9rx
         g0Qf9XR3MQ+KhloYSEQpZ9cxXUugf9tw8nw0ydh+4eYl5ToqoqlW4fLvTMsNR1JkMKsM
         bJj7dOIl2rFbha9gMd4cfAKuXgw29IvQWTI2GRhlTGiSbEKagWyHWrY9Rp4SjWaN9AFT
         Mb9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VnPGdyzEVlios+LG3+SMJVHhVByrNg1HzWkI/GkmuZU=;
        fh=S69h0lz6t0bqD9Ukoj9e1KE+608Bbh+gghWmUwEN7lE=;
        b=BcGEh21fhsOrWtGtNggjL6WKTYWfbGNJQxhr9EZ6YQZ8nhnNr/YJjlfUmbaCOD/6OF
         R7EwgSoimXTfOu1yZJq3ivSXHWEsR3RGFwpp5mPG4QQCN3Ohmmly2mUFZtOnWrBfSubD
         flUVc3U7bqlUKeFFGuAELUV0X4EVKAVX65/CcAzjJvCd+JsE3XTiUJA5rLyEc258gJJN
         esQRdCK4B+Jz88Sv2Zei050nPnCGqXbHvphsTY7AsWR9MgxhcSj/RCklGpsdwzpzC1M0
         jC28HZhhMuz2pA+pGo0XmzY6MWfKoJki1V1tqrXuOakvpUc4tJt8gdLIhwSeBJm1js9w
         9tww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794562851; x=1795167651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VnPGdyzEVlios+LG3+SMJVHhVByrNg1HzWkI/GkmuZU=;
        b=dOrlXi+32Xz28h8kHCBNRNklAoLM6O4tA2wHZjenhS4xtWY0trH/3RdjDockXuYQ0z
         mgIgySmz+nr0EtqEsBmkfovUVfGFyCUm2uKPom5eaqshPsiw3GU58jPQS8bJiiSIY6L9
         uX5obnpPBVxLBvw8apFK73HnKe2vHpqroCfdoFiIk3yCzrEKWADiV+GGhfInMZ2JRDab
         fFuOkYjBynioPS849eZ7U79BJouPRX9omnQ2rCJ6nA7bo6gpMSYPdEffG9E8WtsNDip7
         HtJt1E/hxUyJfAZM1KV1Lfw3MWCzSZlIgDKQEPD4xKwaJIssHtdEX4GvOYNV19fV4R2h
         +X7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562851; x=1795167651;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnPGdyzEVlios+LG3+SMJVHhVByrNg1HzWkI/GkmuZU=;
        b=W0YmAvSZR7y3dPPc2v25bSrN3CqaoEH9+jM29Y9wUkj3V4taf2WPDd8Hp2Gqpn5P5E
         j1rd6DAKj+SfLq6r/pGWWiu9cyt7pK+NkKOQp4Q3EO8sgFb+BYTe6cT0gRoenYR+L2Oc
         sr1R8t0Kip3jzinY4NT/6h/3kv+STls4kmTgRwZtgg1N4xS0z5PYkFPTpJQnR8Qv4hzN
         dYWj5tBC5mZPGAA5zKJsDx2HQKbPXPepl5ZrGPJi5KRktZhJ756bNw/NSb/tjjY7pEFT
         4yyWnpMSNP8gz+EJS7TpWOqY4FYM6ou8xm0IQv8HW6AcFUKGnfVYPvC1rVRjX4hH2DXG
         qesQ==
X-Forwarded-Encrypted: i=1; AL+hErFEfJtN2rTDE+lvaTLo4k+d1gaRGl+6j5w8xMlEixDX8Cignn5bDi5KJHBPCoj0HZkhW5KLJWiiTDm7pzNrqQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9SMOd3kM8fFmJQjpfJk7+pubmKMZWaWGMMoJMptcb0+Wx0kVVA
	aJLXJMjE1hpkVR4At3bmr4uM/NLY3t7X1wYHGml0DcnTQa3/G0ZnUITS/HP7KAWu5QvabzSkkbw
	GYXxZvuJg2Tnr6LE52HU0ZGsgEuY8HSRnkyJs/oNcdmCBlGTrvFbK1DAcm47vNe8YSpRAw6lhkc
	bRwgvohIu6xqlff9462Er58In2v2TvW8q19NGsqveD9nvX
X-Gm-Gg: AYBFou32xFOlT7tvoBSFDJn7pxUo9UdO9fgscYITVexTZXV+0tsgL2RCZKw3jCUQzsI
	u4/qAPbhumgzbsRHtxeAvJIIVW2mzE3m/ubDx0AMcP1N+9KVV0CUYbS9HL1OJoK/foLMVjbMI8L
	gQDRZUBtSneojdsjasOiWLdER9h8TJ+4kqyoxQ/X3tN9FOacXHdKNtG0sKAe4qSjFe2LhmnO2zC
	8/l3s36oEkVsYerUAITIiPMcbHOwhkMnNHZ8BOlbaCSeGq2+195vPz6CFP1EnZ7wZ3qHbXWxaZC
X-Received: by 2002:a05:620a:2616:b0:93e:c6ff:b787 with SMTP id af79cd13be357-9494baf6061mr306641585a.13.1794562851399;
        Fri, 13 Nov 2026 01:40:51 -0800 (PST)
X-Received: by 2002:a05:620a:2616:b0:93e:c6ff:b787 with SMTP id
 af79cd13be357-9494baf6061mr306639085a.13.1794562850904; Fri, 13 Nov 2026
 01:40:50 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260927-ath10k-bundle-status-v1-1-a1eea048ada9@nagashi.ma>
In-Reply-To: <20260927-ath10k-bundle-status-v1-1-a1eea048ada9@nagashi.ma>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:40:39 +0100
X-Gm-Features: AclHuK_8b8bwFHBBv8-vor330OglvaejRUeIF8CJZhplHPOL4obTXFv6PeqHxyE
Message-ID: <CAFEp6-3EjRbdx5JuC9Xt+j5eY7R+CG-iFerDDB2n2kSzk55LuA@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath10k: fix status of bundled mgmt tx completions
To: shunsuke@nagashi.ma
Cc: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af6db24 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=RNmw_1-gx_wr1L6n6KYA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: ApA6c5aYpXHnWIaljiBRd0SNtr2cOGL4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzOCBTYWx0ZWRfX6luuZ+vpmP4w
 aHuNp/2x9GyFA9dWQ1IpIlfxDbZBjJJg3BpTesv09/bL9bx0KXAH4qKHWQiMlaOAr8iG6iAj0QJ
 nYokWxn3TAbTa0di6YTXmHkIJCwPnqiCn9cBEe/dN0OedRq9qcQCJZwb/YwkowLP4aKzXgfc5UW
 nsa538c3+kAokcDpYFEcC+aIHK/f6gyfv3cAeApyyzi4Iv4vhnVgeK/Qzyi4ch5EkPxI9y3TULF
 npi7b7B8K9hVf/ncIm9dBE9L6+Y8LfbqYv0E9pUsUv9qf7xQtKc1WxUktUbfOMwyrtz3so0pnFN
 HvBNhQCE7qHkuQ9wySK3CMURl6RSfGsIndrf+79KJqjEi8zqLYTquTMCeWYWIgA2dT+Cj+0e7IC
 XoyvYcjLj1E2LaL6spDagHT89AhuH7UNfaFwtYrzJXyY8bT3NcLJliOaDg1eshmMCVtGzJJXkWy
 eOQt3iaaJuLG/XBZrMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzOCBTYWx0ZWRfXytz1ZUZ4GR6S
 wIH8sNrqsF41K0MbyU3y7l3UgUg+kEyQVbnMWJmlgGCenTxmtCTM8rXykbVnUVhUybi+ODqjyI6
 q/Vbiyl/mVsuuKi+QN8mfk+IIoJN8Ks=
X-Proofpoint-GUID: ApA6c5aYpXHnWIaljiBRd0SNtr2cOGL4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130038

On Sun, Sep 27, 2026 at 2:10=E2=80=AFPM Shunsuke Nagashima via B4 Relay
<devnull+shunsuke.nagashi.ma@kernel.org> wrote:
>
> From: Shunsuke Nagashima <shunsuke@nagashi.ma>
>
> ath10k_wmi_event_mgmt_tx_bundle_compl() takes the completion status of
> each report from desc_ids[i] instead of status[i]. Any non-zero status
> is handled as "not acked", so a bundled report is marked as acked if
> and only if its descriptor id is 0, whatever status the firmware
> returned.
>
> The bundle handler read status[i] when it was added in
> commit cc123fac978f ("ath10k: Handle bundled tx completion for
> management frames"). The commit named in the Fixes tag replaced it
> with desc_ids[i].
>
> Seen on WCN3990 in station mode with a WPA3-SAE AP. This firmware
> advertises mgmt-tx-by-reference and completes some management frames
> in bundles. A debug build printed status[] for each bundled report and
> could switch between the old and the fixed line. A sniffer watched the
> AP channel. The firmware status[] matched the capture in all 39
> bundled reports (15 with the old line, 24 with the fixed one): the 30
> frames with status[] 1 were never seen on that channel, and the 9
> frames with status[] 0 were acked.
>
> With the old line, 6 of the 15 reports gave mac80211 the wrong ack
> result:
>
>  - 4 frames that were never seen on the air were reported as acked.
>    Each report arrived after mac80211 had already timed out the
>    authentication, so they had no visible effect in these runs.
>  - 2 SAE commit frames that were acked on the air were reported as not
>    acked. They were the second and third of three tries. mac80211 gave
>    up on the authentication 239 us after the last report, although the
>    AP's SAE replies came about 5 to 8 ms later, so that connection
>    attempt failed.
>
> Take the status from status[i].
>
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.2.0.c10-00459-QCAHLSWMTPLZ-1
>
> Fixes: 4b816f170b1f ("ath10k: add support for ack rssi value of managemen=
t tx packets")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM sparse
> Signed-off-by: Shunsuke Nagashima <shunsuke@nagashi.ma>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Tested on a comma four (WCN3990) with a v7.2-based kernel
> (7.2.0-vamos-7626c37). It also carries three out-of-tree ath10k
> patches (MAC address, in-order rx A-MSDU, SET_KEY wait); none of
> them touch wmi.c or wmi-tlv.c.
>
> - Debug build that prints status[] per bundled report and can switch
>   between the old and the fixed line, with a sniffer on the AP
>   channel: 6 connect/reconnect runs (5 WPA3-SAE, 1 WPA2-PSK),
>   39 bundled reports.
> - Build with only this patch: 6 connect/reconnect runs (5 WPA3-SAE,
>   1 WPA2-PSK), no debug output. No warnings, no firmware crashes.
>   One first connect failed and one reconnect was slow, for a
>   different reason that was also seen with the old line: the AP did
>   not ack, and the firmware held back some Auth frames.
>
> Not tested: status 2 or 3 inside a bundle (only 0 and 1 were seen),
> AP mode, other chips and firmware versions.
>
> I worked on this with Claude (claude-opus-5-5) and Codex
> (gpt-6-astra). They helped go through the logs and sniffer captures,
> write the debug build, and write the English of this changelog. I ran
> the tests on the device and reviewed the change myself.
> ---
>  drivers/net/wireless/ath/ath10k/wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless=
/ath/ath10k/wmi.c
> index e57588c19..67be6e817 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -2512,7 +2512,7 @@ int ath10k_wmi_event_mgmt_tx_bundle_compl(struct at=
h10k *ar, struct sk_buff *skb
>         for (i =3D 0; i < num_reports; i++) {
>                 memset(&param, 0, sizeof(struct mgmt_tx_compl_params));
>                 param.desc_id =3D __le32_to_cpu(arg.desc_ids[i]);
> -               param.status =3D __le32_to_cpu(arg.desc_ids[i]);
> +               param.status =3D __le32_to_cpu(arg.status[i]);
>
>                 if (test_bit(WMI_SERVICE_TX_DATA_ACK_RSSI, ar->wmi.svc_ma=
p))
>                         param.ack_rssi =3D __le32_to_cpu(arg.ack_rssi[i])=
;
>
> ---
> base-commit: 753baa59527f8e606c49eac25692b8b08918a3a9
> change-id: 20260927-ath10k-bundle-status-24113117b683
>
> Best regards,
> --
> Shunsuke Nagashima <shunsuke@nagashi.ma>
>
>
>
