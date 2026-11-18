Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993269;
	b=XTbEmzRmECTQzPW27pFBaBSOTlk4Lcb2nm4uFomTm383kiDRJX4NKDhaTadJ7bmdHeAQ
	 kkWFrO93G96eZ7fAm12qdTxp8HCnqC6xFuIeN+/izLkH+SptbInNzoHwWJ2D5aVUyrqOi
	 iNNyUzDaspAKSj1VpHqfroKx2xqQA4PqWWfQrApmczJovnnG+4ejUjBSfDtjRPSPgFgng
	 DOE2YC/fRkNMPDbgGgUwKL6ENn2LToesFaPzP33R6aHyrj+yiC/Pbe6AqnH8U1zVlFpU2
	 OUwtzR+1MEn/rqp+LBxJy1pS1a2DpIHVbpTlqX51TxlDTFiGpwi/ZIh6OfYdtWwmitg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993269;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wrWsmpFUEsR3lRS9lv6ubqR22/udzNI+pJsuck8/tuw=;
	b=IIGL04ZC3lRUv/SN4IjTqQ6g/6n12HCQTAd8I1LAxG3SwSK0S/TpMFm+M6V2CIPNaBEN
	 qsZwqyJJoK2Yuw05P63PDOeKHX8IxCGke/Frxvbs1ktU+EMQyY/gOZ6y52qDoMVRGydb0
	 t+kIl5+rdrL8gLQ/r16B19qnmg2/AMml4JGq+mNGs1kU5nC68pWdnIxn+GhpQKnmCnpbw
	 dK3u2R3ZuSbN63DNrJoIcy56z1CkFvBT+QmpugYX9KojbRBHrkZchjsw8rh4kCs71tyJW
	 aAW1Xacm3+CqyGTROSGCEqW6p+pkzh3prPK2uSe6ExJ2eUpx9V55ZMMY3Jh9EkDpzYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="tg/AuriT";
	arc=none smtp.remote-ip=95.215.58.172
Received: from mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C241606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 09:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C241606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tg/AuriT
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=wrWsmpFUEsR3lRS9lv6ubqR22/udzNI+pJsuck8/tuw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794993267; v=1; x=1795598067;
 b=tg/AuriTVhjeVsvcsQpXTRXG7nvT4FcnGsUbW9qWJzH5iEQI+XOqRzq68YbyEgKPLVAUsrGX
 QZdsOdV5JTQvXNd5hDbjja0JKGBit3VGxynuWoPm3q6eJsQSJ27f1ULdrIYqtW8qGIvkxuS3H3K
 tN8JRolSIG9Elr5Y7ZigSj4k=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6f0aaf4e757ca185;
	Wed, 18 Nov 2026 09:14:27 +0000
X-Mizu-Trace-ID: 6f0aaf4e757ca185
X-Migadu-Flow: FLOW_OUT
Date: Wed, 18 Nov 2026 10:14:24 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Mehmet Fide <mehmet.fide@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, mehmet.fide@screeningeagle.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v12_2/3=5D_wifi=3A_rt?=
 =?US-ASCII?Q?w88=3A_support_channel_switch_in_AP_mode?=
In-Reply-To: <20261118083328.1984956-1-mehmet.fide@gmail.com>
References:  <20261118083328.1984956-1-mehmet.fide@gmail.com>
Message-ID: <FCDF8941-48C3-420B-AC7A-598406EADCF4@linux.dev>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On November 18, 2026 9:33:28 AM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:
>Hi Luka,
>
>> I think the presence check is better fixed in
>> rtw_core_check_sta_active(). Its callback only reads interface state, so
>> could it use an atomic interface iterator without allocating entries?
>
>Right, the callback does not sleep, so rtw_iterate_vifs_atomic() works
>there. The check is older than this series: since commit 96fbb84de4ff
>("wifi: rtw88: handle station mode concurrent scan with AP mode") a
>failed allocation also makes rtw_clear_op_chan() drop the operating
>channel of an associated station, on BSS_CHANGED_BSSID and in
>rtw_ops_stop_ap().
>
>Ping-Ke, Luka: would you take that as a separate fix for rtw-next, or as
>a patch before this one in v13?
>
>Mehmet
>

I am ok with either, so as far as I am concerned do whatever is easier to
you.

Best regards,
Luka Gejak
