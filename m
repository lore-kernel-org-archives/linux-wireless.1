Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595870;
	b=uXbUZi7iKp0dDQDpwOtWce/LsSoQQGg9xovGjDQb/PkWj5mHUdIRpch0UdbeIsuTEXDc
	 EZuSBn198rBZJU+t0fVi6DXEXscQcY24acjsMGU8cidXeXYZwI3IfTn7D/l7LIMBvzahm
	 NKwcPuNnt3kYXkJclcu9b5m98Rg6a+mab1rO+UOUdcXKvKKIWX/RH6Ag4yunCgx6JVltE
	 3xNO1y4b16MdeHNWdLxFgNL264UIhaSIZy2JiVQpktY/HncK0vW7n1MlwtGOUtZ9iHbjx
	 YhxdpWvtxzce9SglcibwwklNN3ovSm2U2AgbUBpCStYSd/AR1mlHg3CsWCnzCdYM84w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595870;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QhHlHjsDdOVj/3baTu/MsshkKzNrvxn7J1+4sbYhsTI=;
	b=W2gDOm+7UrfGhRM1f3c2tYqWyRFGjqOAdHmS6ToPwUshQeuBLTQ5SAtfrOuVR8SYZPJe
	 A5UZRHFQWSbLD4CuA48tv6Z4RtIky1SWE+eMcIYlVSz4GzULoOLxWWmGl8r92+i11kIgp
	 Np6nP+kdWXd5V+zR9dAhjRrTNjcCXqJgGtTgyp7o1ZIGDchpAmWx2DtT6djQeq4LGMpxx
	 euw7fRyZWZsBYNnQbp8nCqPvqsUKROOeqCmovE8Rk6ZKRcddVSqYzUiy5TNb3X9nq9MZa
	 Znx1ePcibUGEUrYS91pGXkId+40BstRvyD7KTtG+I8gt/FsQDsfnPesyu7cjSkplmjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rZBykA77;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68085606A337
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 08:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68085606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rZBykA77
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38190551625so10968455eec.1
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 00:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795595869; x=1796200669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QhHlHjsDdOVj/3baTu/MsshkKzNrvxn7J1+4sbYhsTI=;
        b=rZBykA771xTrgbY+3v6FLUdxAE0Gd0iqQhBHIlubrwUKu1kj1bITqbqYzIRrBdKyBE
         lmVU61NigHqgy852r8Ef9jHv1Cqa8GvFNpJUyVizYkXFuSVGPtkeUzj2Ao13XrygGRUP
         f+2W0Dd/0q4BhcTNog1cJTcQHkURrloKqDhSDRV0Nl7VWul0Y/q/3cnkz/tk4BkfiF7I
         iukOPRUWN/NvwjR5py8UiOAEpgxVqZC8vAg4EjZAiOCqDYaKG01LHFAeHvCfJZe+419S
         o+rSP9ubTaS/e9rJ8gNaFRZddMTmJTurf9SKZvFEV8Ej/+gItHQDoTuWhWqM+2Ix9Xxz
         jQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595869; x=1796200669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QhHlHjsDdOVj/3baTu/MsshkKzNrvxn7J1+4sbYhsTI=;
        b=SX/84D4BElUEKKigBxH/RkSywlcZiAppNGxcNB52LWoQqpNmrw5XaI3LK9HDycVuql
         FU4eF1v9vNE2WUB+m2ri++S+wY8S6QwJFZHE0yPuo2XuQ+znMZC8LMjcKy9tm/4RfDWs
         xb6z0kbe4958tf7q/pFJTSvLn8H3wNUrpOgT4yFGcacCEB9VirhCoMmjYnbDZXHPpObV
         MNifP0vF5KC56fNznKxh7vdw3JtuetPNbKbdYMZklYSfqRtFm5u+OqNCSvofxjoUZIKt
         YpKuFgwR/9E2kherqR/wDeiZKCgRWyJRNx/j0qTTbsK3b7K0xIrCc9rVlxDCK5evRSxP
         Nyhg==
X-Gm-Message-State: APuU4Z9wQ1dXD18SpjsuUPTgDHZokpIJnjPwJFAzTdbmSXZSXXQMl0fa
	MoRMvixsDGnOVQDrMTZg5TA0cqIgclIclPqWF8acCwySMOzsF8yCjG529TYCQA==
X-Gm-Gg: AZFdTZc7zJiA6RFHuMt4bk84/7n+jU8Xhk/9klZ9ILQNLIyrCJF9eJeJXaTfBCnH7i1
	mRcZzl0/l2rV8SLSkmWDPZBEd0T7k+3tpXjHiW0K/c7zMPDB/HWHBIHOoZKYEowHo+FPmhsvkNt
	UoI50+bSFhwXcPB6Zg7qpxjoha3k7d9BzXwWu5nKyc19ojpz5T5y+rcQPqD4eJ38/tnmPgaK3TX
	HbW5BUglYGx2umojcD1Ce4h7T4MDHFMMwIHtKAELLPsRu4ccTC/r9N8d0wmpBLOlljsXfV1blI2
	Y5nlTYgvCJ2KBCi8SK8yxccdzmFf6afVwmS67e8Tz98nCJjzNr6b8l1p5APIBPatMA9t3G9pVjL
	qGJBN6v25GOPyAa+Cd7ChOA29JYK+d2XgPh6YOdAX+lVsChRtvbA+k24+wJow12ZfPksT7JgB09
	fzqCAJwuj+2vrmXSkn01a716lWViklbA0hA6MsKZlRC93dOR33mRM0oqp1Pu4sCd6S7RmAMcXLA
	z4MysJdBrVMQCw82c/LWkOEgLE/sCNb0AvKAH2X+xcREUCxl0VrSgPFk0QW1tE+u4wXeZNmUgHI
	dpog7fbPVht0xaqWG1LbvCAF9DWPVlRfUfMroWSbyLocOVBTuaIJTTNOBzGywrrjTwaSU8IwfdA
	=
X-Received: by 2002:a05:693c:8042:b0:379:8df3:d2c9 with SMTP id 5a478bee46e88-3856f14ca78mr18895450eec.13.1795595869425;
        Wed, 25 Nov 2026 00:37:49 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3866f299d0bsm43927422eec.19.2026.11.25.00.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:37:48 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH iwlwifi-next 2/4] wifi: iwlwifi: mvm: validate BAID in the RX path
Date: Wed, 25 Nov 2026 16:37:40 +0800
Message-Id: <20261125083742.1355074-3-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125083742.1355074-1-maoyixie.tju@gmail.com>
References: <20261125083742.1355074-1-maoyixie.tju@gmail.com>
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

iwl_mvm_agg_rx_received() and iwl_mvm_reorder() index mvm->baid_map[]
with the 7-bit BAID from the MPDU descriptor. A BAID from 32 to 126
reads past the array.

Check the BAID as iwl_mvm_release_frames_from_notif() does.

Found with a CodeQL-based static analysis tool.
Reproduced in a userspace harness under AddressSanitizer and UBSan.
Not tested on hardware.

Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
I used an LLM to help write the harness and this patch.

 drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c b/drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c
index 77a3d8dcab57..0dfbf704d5d3 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c
@@ -817,6 +817,10 @@ static bool iwl_mvm_reorder(struct iwl_mvm *mvm,
 	if (baid == IWL_RX_REORDER_DATA_INVALID_BAID)
 		return false;
 
+	if (IWL_FW_CHECK(mvm, baid >= ARRAY_SIZE(mvm->baid_map),
+			 "invalid BAID from FW: %d\n", baid))
+		return false;
+
 	/* no sta yet */
 	if (WARN_ONCE(IS_ERR_OR_NULL(sta),
 		      "Got valid BAID without a valid station assigned\n"))
@@ -940,6 +944,10 @@ static void iwl_mvm_agg_rx_received(struct iwl_mvm *mvm,
 	unsigned long timeout;
 	struct iwl_mvm_baid_data *data;
 
+	if (IWL_FW_CHECK(mvm, baid >= ARRAY_SIZE(mvm->baid_map),
+			 "invalid BAID from FW: %d\n", baid))
+		return;
+
 	rcu_read_lock();
 
 	data = rcu_dereference(mvm->baid_map[baid]);
-- 
2.34.1

