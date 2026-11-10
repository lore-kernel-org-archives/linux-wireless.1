Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.64.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286253;
	b=mGYQddKoLuZYANn/fyDMI9tnTCqxj6+Paa4DquxUU5c9KntXWeuP3K8MZ5WqO6rEiFia
	 kg5LEIA+cmE+NaKFv3gjOeDYmm+5LSIywKaJJ4R6SmU3WWpMpkNojVYoNl4U9zXAywwL/
	 I0wA0jVAU4Kv2bP4KFHDeLn3qkQXSf7yXWgFAPlNdFOWUDLODsMPzedff7W7bnSpASuyT
	 a9xi2a3FaVoXPtY8mxWWva52M/W18tMdcS+pAUcN54Nz31abv4QnggbPZWU6kna/0LCLV
	 OtdRcZxQCEfGG1IssMjBLQ3fqidZ4NsLKLJv+Te0vJFDIEb9scL/L/C6RLHwfwrQP/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286253;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 mail-alias-created-date:Received:From:Content-Type:
	 Content-Transfer-Encoding:Mime-Version:Subject:Message-Id:Date:To:
	 X-Mailer:X-Proofpoint-Spam-Details-Enc:X-Authority-Info-Out:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-JNJ;
	bh=T3zz0UtAd5H1d6QnpuXgckasBRjOTczAyhsNBi2a0og=;
	b=xpcJfTpQXzwHhuCahW9dZ1b/J7kVsuCti4z447WbqyTZewxt+mR/QRnyeKCReYuscHdR
	 +OAcvsNywCQ7VN0A3ULrWf7v+Bk5ozd/rw0A9C5XhTyWF32Akjcz4ULg3Ouuh6j/IrZP7
	 7fN/KCuy1xGLA0wfI2Bk9FM6yCFeIU0rgItDUOblTxrsFuJpubQJOAVqxl1KZhpflHByF
	 x2ShVkRztmYFLz67ei2wbSMTyUqPPd++XNdNgPoVVo9dckPYg37szHqoqCy/2WGbFt9+A
	 Qg3y+IfQT7aXhWfHO7HFIL1C/0XInTO2ZTXTzc5PEjdSvhx4c6RQemz5aF+borcdLwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=listopad.email;
	spf=pass smtp.mailfrom=listopad.email;
	dkim=pass header.d=listopad.email header.i=@listopad.email header.a=rsa-sha256 header.s=sig1 header.b=BnUAPYFm;
	arc=none smtp.remote-ip=57.103.64.139
Received: from outbound.pv.icloud.com (pv-2002i-snip4-8.eps.apple.com [57.103.64.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F92D606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F92D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=listopad.email
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listopad.email
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=listopad.email header.i=@listopad.email header.a=rsa-sha256 header.s=sig1 header.b=BnUAPYFm
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-3 (Postfix) with ESMTPS id 7C31118001AF
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:50:51 +0000 (UTC)
X-ICL-RepId: 01a1c3cb-6d7c-7899-b271-efbf27d7f0eb
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQpPHV8GXhxBDEAdXABZEhVdRVoKWBlyHFALRwJHClZeXBVSBFtLVBQEFFoeQwRCEV1WVgBWAl5QSxsOXBcDVxxWRVwYQwldBVccHR1BRVsTVRdGCRkIXR0ZCEcfCjADQg5WA0MHRQAtGRxXUFsCQQRWCFIJGQ5fEVAUEwBeDw9MeEkCK3FaAUUUTgpbc0YGQQlPHi8CLXFdezpxLwdeAUAKQQFbdwdbA00XQwxTRVcdWBFfUxcfSwBcRVAYRB9dHWYcXABWAlw=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listopad.email; s=sig1; t=1794286252; x=1825822252; bh=T3zz0UtAd5H1d6QnpuXgckasBRjOTczAyhsNBi2a0og=; h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To:x-icloud-hme; b=BnUAPYFmrEB0BBE0uplAOeY+JWv3rnoHekB+3rixdSHXkT68G6fBcxHq+aKMKQDTrU7zDmi0C2s+mCJ+1r3iW/B7oINUcQTBZssVSqasF7fipmNA2sy+f+0yUNSjMF+li7t2T4sIF0Wy2Vs0ws7t5SpW6PouwtNWEb5+GfboN0cd98yrC7qOGkSCgNAFpbziSoxr/oz2SSXaGTv+/YrfL5+iPJX4VyqeZvN0DHnCn/mDlt+2CJ7dgUYevN98OJpfnKXuJbJBtNVdBg2fI0ooHBLpTUvo0Xreolypmgso4whbN5YZALue8gvbQMmSlL33dZPXA/AzqFXFd5Hwy99Xag==
mail-alias-created-date: 1648896822394
Received: from smtpclient.apple (unknown [17.156.192.29])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-3 (Postfix) with ESMTPSA id 69F611800119
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:50:50 +0000 (UTC)
From: igor@listopad.email
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: [RFC] Adding RTL8189ES SDIO support to rtw88
Message-Id: <A11FF135-696D-4107-B5FC-BBBB05303926@listopad.email>
Date: Tue, 10 Nov 2026 07:50:38 +0300
To: linux-wireless@vger.kernel.org
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX55eM0IxjsU9c
 dLFo9oVc2FC71o5QR7XrbknmGrD85ECK6SX0DAO4xJdCiTUujQgAyMcBFG3ZGaPRzxqW9HGJxqk
 zzvjyfvgEzEsX+fIssnQBvuAYA7K6bdVJZ9UAor5BrQrOX/XhFYH4rlxa7bTCi5KtlHR8WBXm3z
 RF/uF0D0i8ybmcHLJm641EJxkEOy86edHOBC7tHNHsirra15XPx0jTmU/6aP/mQ+dlS9APHqvJt
 Mf9holIslFjW53Jq+3RD0QCuEdRY3WZelD5KKTzz+/pd1fhbz9p4oLTduro6BBC8RB9nspdI3DN
 P3hgqL4ObCbjGkQF++URFgVCRIFtfQNVUVj390Q36qTSnbplLOJ4qtvOJ2/avE=
X-Authority-Info-Out: v=2.4 cv=bZxmkePB c=1 sm=1 tr=0 ts=6af2a2ab
 cx=c_apl:c_pps:t_out a=aW9mcIavGNWWFvFFKOxBSA==:117
 a=aW9mcIavGNWWFvFFKOxBSA==:17 a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10
 a=1oJP67jkp3AA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=OQxEHLKw9ncRtpN2p10A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: rNZ7LKWo1uw7vkbRocHwVshWR8ojzKc6
X-Proofpoint-GUID: rNZ7LKWo1uw7vkbRocHwVshWR8ojzKc6
X-JNJ: AAAAAAABpdIVBTDFNOcRFVfKkU89zgUAvY8P7BPf4UxLRUPAFoTdst3mrZ4b1NGn7SbFhU
 9zyj4ve5MgfHojM8+0Fcm5TIEprsMMwYm78nXAM5VF6toA1dvMLH1M2lPcNMwBTljNeE5O
 fMlxrM1oBAHgmlw6p4eQ1u7nY5rO7ggB1133TvO44SiIwDgjYBNryGW7v1MTU7agzzs3a1
 LBhtdthacidS3yTX4QEO5WBYmCTdMUXG7dY5FXM0PcxqdakECG67aQPsjmB2K0hyP/ubOl
 zo6kKspqYNuULLFVmtbk+gUPADtBu5+MWfWgTlQ/CvRlK+SWNYuw6DE2yUp5ODvKarmVoh
 f23oIhPejCq4QXYfpPtBITwkFPkRZMjl1l0AWn18DOIE70Y0n5SZVd8KtXhqOlp9xTvBX5
 4Vgl3JktkhoGYRE7JMlI2RbfLgBtjmLl33BY0AuP+556e+TcZMVmxKaLws7DG9eFBqaS/T
 oHYe3gkDOIgw3g2kbC5gp8cYiXcRmz7W8NgZwjD1EIKDQUJJ6RZXv7SdTPTBYgncw7OkVy
 LnBxnNBeemVqD2YMNhHUSemw7qDkRDKMiVzWil0+ZiwR2cBu/BErJ7yZRZPOhNyqSmN0Ux
 GcSGI4iBYeHFTtNR48d8fl1J6Dcj9UjjxusVGzWFocxV6Yjd53cyWl1B5DWR/BsccpqFuL
 KYcf3j0aTCwJ9RoVsDDklrdlXwXxJduwqELCgNzUEFLvRQowRPUqGIQDCBSlMpFhfOxZ1n
 L8ONexHzot94bU7eaVlY/+5ruM96xY90RPgx/G/a4eFxNsMXnR9FDg/VEX2fMZ2uhiKnPk
 EX+VLrR3jhvQYnrjxlmQra9VfI6Q/m3OVAr9imJxyndrKU3oQRsw8dZhAJ1u7k2SVYJIxb
 mMbyNs1eD+d5yHfUzbuvAmZPaldV1iucnyKe/skDngsSdbOJyuC9QtUTCBDKaqc/R6ZnqK
 QZqfrxGHQBML2h8gYtF5EADrgu8H+SZ+/qourQpo3V77KzWu9yZbvNP5sETEgVttI1wQz1
 OXdyKdRKpMEf/FLJz1RbTvNq8WwZ+cQRezA8gv2kaFh6JoT4S3nb8BRVxvNO3CqImMpoPN
 XG+Siz+zE2QVfNoD61lcm+dC7r6i9VL3Vv6VUH2280jz34oIiqIq8gzC4KcBkCPgqTTUlZ
 eIwLiHel1Q4PUhsrE3XyTqLI2E76gXo4WceEv0UFWhibK0UQJ34rOwxgjszX7xGgaiZzat
 3pG9QnEE4S8lMgy1O4+NN3EWDkIE99WM/33Od01mErrw+/cjQZIgS2P4u9k+zo0SZBZR6K
 NcOAs/

Hi,

Would support for RTL8189ES SDIO devices, based on the RTL8188E T-series
(SDIO ID 024c:8179), be welcome in rtw88?

An implementation is available in lwfinger/rtw88 PR #465:
https://github.com/lwfinger/rtw88/pull/465

Following feedback there, I am contacting this list before preparing
a patch series for the kernel.

The implementation adds chip operations, register tables, firmware,
and an SDIO binding. It handles the chip's legacy TX/RX descriptors,
TX reports, host-side rate adaptation, calibration, power saving,
beacons, and reserved pages, while integrating with the existing
rtw88/mac80211 infrastructure.

All rtw88 modules have been built successfully. Hardware testing
covered STA, AP, concurrent AP+STA, WPA2 connectivity, bidirectional
traffic, multicast, scanning, rate control, power saving, calibration,
and interface/module lifecycle operations. Regression testing was
also performed on RTL8723BS.

Would this be an acceptable direction for rtw88? Are there architectural
concerns or requirements that should be addressed before submitting
the series for review?

Regards,
Igor Listopad
